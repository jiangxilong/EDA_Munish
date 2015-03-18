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

#include "profile_cnt.h"

extern void delay_ms(u32 ms_count);
extern char inbyte(void);

/******************************************************************************/
/************************** Macros Definitions ********************************/
/******************************************************************************/
#define HDMI_CALL_INTERVAL_MS	10			/* Interval between two         */
											/* iterations of the main loop  */
#define DBG_MSG                 xil_printf

/******************************************************************************/
/************************ Variables Definitions *******************************/
/******************************************************************************/
static UCHAR    MajorRev;      /* Major Release Number */
static UCHAR    MinorRev;      /* Usually used for code-drops */
static UCHAR    RcRev;         /* Release Candidate Number */
static BOOL     DriverEnable;
static BOOL     LastEnable;
short int FRAME_INTR = 0 ;

unsigned char current_resolution;

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
			current_resolution = receivedChar - 0x30;
		}
		else if (receivedChar == 'q') {
			DBG_MSG("Exiting Application. \n\r");
		    return(0);
		    }
		else if (receivedChar == 'p') {
			DBG_MSG("Showing processed video. \n\r");
			SetProcessingMode(1, current_resolution);
		}
		else if (receivedChar == 'r') {
			DBG_MSG("Showing raw video. \n\r");
			SetProcessingMode(0, current_resolution);
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
	int cycles_for_processing = 0;

	Xil_ICacheEnable();
	Xil_DCacheEnable();

	EnablePerfCounters();

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
	current_resolution = 0;
	
	/* Initialize the interrupt controller */
	xstatus = ScuGicInterrupt_Init();
	if (xstatus != XST_SUCCESS) {
		xil_printf("Unable to initialize Interrupts");
	  		//return XST_FAILURE;
	  	}

	SetProcessingMode(0, current_resolution);			// initially the HDMI controller is configured to display raw video

	while(APP_ChangeResolution())
	{
		init_perfcounters(1, 0);						// initialize the cycle count register to 0

		while(FRAME_INTR == 0);
		FRAME_INTR = 0;

		if (ATV_GetElapsedMs (StartCount, NULL) >= HDMI_CALL_INTERVAL_MS)
		{
			StartCount = HAL_GetCurrentMsCount();
			if (APP_DriverEnabled())
			{
				ADIAPI_TransmitterMain();
			}
		}

		cycles_for_processing = get_cyclecount();
		xil_printf("Total cycles needed for processing the video-frame = %d\n\r", cycles_for_processing);
	}

	Xil_DCacheDisable();
	Xil_ICacheDisable();

	return(0);
}
