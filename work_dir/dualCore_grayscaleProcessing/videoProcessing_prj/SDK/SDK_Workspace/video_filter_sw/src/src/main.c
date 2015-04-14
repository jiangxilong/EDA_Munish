/***************************************************************************//**
 *   @file   main.c

*******************************************************************************/

/******************************************************************************/
/***************************** Include Files **********************************/
/******************************************************************************/
#include <stdio.h>
#include "xil_cache.h"
#include "xbasic_types.h"
#include "xil_io.h"
#include "cf_hdmi.h"
#include "atv_platform.h"
#include "transmitter.h"
#include "xil_exception.h"
#include "xuartps.h"
// for interrupt handling
#include "axi_interrupt.h"
#include "xscugic.h"
#include "xil_mmu.h"
#include "sw_functions.h"
#include "xpseudo_asm.h"

#define sev() __asm__("sev")
#define CPU1_MEM_BASE        0x00200000
#define CPU1_START_ADR       0xFFFFFFF0


extern void delay_ms(u32 ms_count);
extern char inbyte(void);

/******************************************************************************/
/************************** Macros Definitions ********************************/
/******************************************************************************/
#define HDMI_CALL_INTERVAL_MS	10			/* Interval between two         */
											/* iterations of the main loop  */
#define DBG_MSG                 xil_printf

/* Define a data memory space which is visible to both CPUs, the OCM is ideal
 * since it is the lowest latency memory which is visible to both ARM cores.
 */
#define SHARED_OCM_MEMORY_BASE   0xFFFF0000
/* Declare a value stored in OCM space which is visible to both CPUs. */
#define SEMAPHORE_VALUE      (*(volatile unsigned long *)(SHARED_OCM_MEMORY_BASE))
// share the currentResolution variable so that it is visible to CPU1 as well
#define shared_currentResolution (*(volatile unsigned char *)(SHARED_OCM_MEMORY_BASE + 100))

/******************************************************************************/
/************************ Variables Definitions *******************************/
/******************************************************************************/
static UCHAR    MajorRev;      /* Major Release Number */
static UCHAR    MinorRev;      /* Usually used for code-drops */
static UCHAR    RcRev;         /* Release Candidate Number */
static BOOL     DriverEnable;
static BOOL     LastEnable;
short int FRAME_INTR = 0 ;

XScuGic InterruptController; /* Instance of the Interrupt Controller */
static XScuGic_Config *GicConfig;/* The configuration parameters of the controller */

int ScuGicInterrupt_Init()
{
	int Status;
	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 * */
	Xil_ExceptionInit();

	GicConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
	if (NULL == GicConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(&InterruptController, GicConfig,
			GicConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	 // **** Setup the Interrupt System *****

//	 * Connect the interrupt controller interrupt handler to the hardware
//	 * interrupt handling logic in the ARM processor.
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler,
			(void *) &InterruptController);

//	 * Connect a device driver handler that will be called when an
//	 * interrupt for the device occurs, the device driver handler performs
//	 * the specific interrupt processing for the device
	Status = XScuGic_Connect(&InterruptController,XPAR_FABRIC_CAM_INTERFACE_0_VSYNC_NEGEDGE_INTR,
			(Xil_ExceptionHandler)AXI_INTERRUPT_VsyncIntr_Handler,
			(void *) &InterruptController);
	XScuGic_Enable(&InterruptController, XPAR_FABRIC_CAM_INTERFACE_0_VSYNC_NEGEDGE_INTR);

// 	Enable interrupts in the ARM
	Xil_ExceptionEnable();

	//Only used for edge sensitive Interrupts
	XScuGic_SetPriorityTriggerType(&InterruptController, XPAR_FABRIC_CAM_INTERFACE_0_VSYNC_NEGEDGE_INTR, 0xa0, 3);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	return XST_SUCCESS ; 
}

void delay_us(u32 us_count) {
  u32 count;
  for (count = 0; count < ((us_count * 800) + 1); count++) {
    asm("nop");
  }
}

/***************************************************************************//**
 * @brief Enables the driver.
 *
 * @return Returns ATVERR_OK.
*******************************************************************************/
void APP_EnableDriver (BOOL Enable)
{
    DriverEnable = Enable;
}

/***************************************************************************//**
 * @brief Returns the driver enable status.
 *
 * @return Returns the driver enable status.
*******************************************************************************/
static BOOL APP_DriverEnabled (void)
{
    if ((DriverEnable && HAL_GetMBSwitchState()) != LastEnable)
    {
        LastEnable = DriverEnable && HAL_GetMBSwitchState();
        DBG_MSG ("APP: Driver %s\n\r", LastEnable? "Enabled": "Disabled");
    }
    return (LastEnable);
}

/***************************************************************************//**
 * @brief Changes the video resolution depending on User input.
 *
 * @return None.
*******************************************************************************/
static int APP_ChangeResolution (void)
{
	char *resolutions[7] = {"640x480", "800x600", "1024x768", "1280x720", "1360x768", "1600x900", "1920x1080"};
	char receivedChar    = 0;

	if(XUartPs_IsReceiveData(UART_BASEADDR))
	{
		receivedChar = inbyte();
		if((receivedChar >= 0x30) && (receivedChar <= 0x36))
		{
			SetVideoResolution(receivedChar - 0x30);
			DBG_MSG("Resolution was changed to %s \r\n", resolutions[receivedChar - 0x30]);
		}
		else if (receivedChar == 'q') {
			DBG_MSG("Exiting Application. \n\r");
		    return(0);
		    }
		else
		{
			if((receivedChar != 0x0A) && (receivedChar != 0x0D))
			{
				SetVideoResolution(RESOLUTION_640x480);
				DBG_MSG("Resolution was changed to %s \r\n", resolutions[0]);
			}
		}
	}
	return 1;
}


int semaphore_cpu0_init()
{
    /* Only CPU0 should be responsible for initializing the semaphore. */
    SEMAPHORE_VALUE = 0;

	return 0;
}

int semaphore_cpu0_signal()
{
	SEMAPHORE_VALUE = 1;

	return 0;
}

int semaphore_cpu0_wait()
{
	while (SEMAPHORE_VALUE == 1) {};

	return 0;
}

void set_sharedVideoResolution(unsigned char resolution) {
	shared_currentResolution = resolution;
}

/***************************************************************************//**
 * @brief Main function.
 *
 * @return Returns 0.
*******************************************************************************/
int main()
{
	UINT32 StartCount;
	int xstatus;
	MajorRev     = 1;
	MinorRev     = 1;
	RcRev        = 1;
	DriverEnable = TRUE;
	LastEnable   = FALSE;
	//int delay = 100000;
	//int delay_var = 0;

	semaphore_cpu0_init();

    /* Disable caching on shared OCM data by setting the appropriate TLB
     * attributes for the shared data space in OCM.
	 *
     * S=b1
     * TEX=b100
     * AP=b11
     * Domain=b1111
     * C=b0
     * B=b0
	 */
    Xil_SetTlbAttributes(SHARED_OCM_MEMORY_BASE, 0x14de2);

#if 0
    /* Set the CPU1 start address to match the beginning of the memory segment
     * defined in the linker script.
     */
    printf("CPU0: Setting start address for cpu1 to 0x%08X\n\r", CPU1_MEM_BASE);
    Xil_Out32(CPU1_START_ADR, CPU1_MEM_BASE);
    dmb(); // Wait until memory write has finished.

    print("CPU0: Using SEV to wake up CPU1\n\r");
    sev();
#endif

	Xil_ICacheEnable();
	Xil_DCacheEnable();

	HAL_PlatformInit(XPAR_AXI_IIC_0_BASEADDR,	/* Perform any required platform init */
					 XPAR_SCUTIMER_DEVICE_ID,	/* including hardware reset to HDMI devices */
					 XPAR_SCUGIC_SINGLE_DEVICE_ID,
					 XPAR_SCUTIMER_INTR);

	DBG_MSG("  To change the video resolution press:\r\n");
	DBG_MSG("  '0' - 640x480;  '1' - 800x600;  '2' - 1024x768; '3' - 1280x720 \r\n");
	DBG_MSG("  '4' - 1360x768; '5' - 1600x900; '6' - 1920x1080.\r\n");

	ADIAPI_TransmitterInit();   /* Initialize ADI repeater software and h/w */
	ADIAPI_TransmitterSetPowerMode(REP_POWER_UP);

	StartCount = HAL_GetCurrentMsCount();
	ADIAPI_TransmitterMain();
	
	/*Initialize the HDMI Core with default display settings*/
	SetVideoResolution(RESOLUTION_640x480); 

	/* Initialize the interrupt controller */
	xstatus = ScuGicInterrupt_Init();
	if (xstatus != XST_SUCCESS) {
		xil_printf("Unable to initialize Interrupts");
	  		//return XST_FAILURE;
	  	}

	//ConfigHdmiVDMA(detailedTiming[currentResolution][H_ACTIVE_TIME], detailedTiming[currentResolution][V_ACTIVE_TIME], VIDEO_BASEADDR_CPU1);

	while (APP_ChangeResolution())
	{
		if (ATV_GetElapsedMs (StartCount, NULL) >= HDMI_CALL_INTERVAL_MS)
		{
			StartCount = HAL_GetCurrentMsCount();
			if (APP_DriverEnabled())
			{
				ADIAPI_TransmitterMain();
			}
		}

		while (FRAME_INTR == 0);
		FRAME_INTR = 0;

		// storing the current frame onto cpu0 memory space
		DDRVideoWr(640, 480, detailedTiming[currentResolution][H_ACTIVE_TIME], detailedTiming[currentResolution][V_ACTIVE_TIME]);
		// grayscaling the captured image and writing to a separate memory region in ddr
		ConvToGrayHLS(VIDEO_BASEADDR, PROC_VIDEO_BASEADDR, detailedTiming[currentResolution][H_ACTIVE_TIME]);
	}

	Xil_DCacheDisable();
	Xil_ICacheDisable();

	return(0);
}
