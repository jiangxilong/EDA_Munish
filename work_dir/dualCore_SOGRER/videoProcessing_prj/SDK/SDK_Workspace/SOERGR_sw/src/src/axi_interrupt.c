/*****************************************************************************
* Filename:          C:\Cases\subcases\nan\929077\sp605_axi_interrupt/drivers/axi_interrupt_v1_00_a/src/axi_interrupt.c
* Version:           1.00.a
* Description:       axi_interrupt Driver Source File
* Date:              Wed Jul 25 16:45:59 2012 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "axi_interrupt.h"
#include "cf_hdmi.h"
#include "sw_functions.h"
#include "transmitter.h"

#include "profile_cnt.h"
#include "global.h"


/************************** Function Definitions ***************************/

/**
 *
 * Enable all possible interrupts from TEST_AXI device.
 *
 * @param   baseaddr_p is the base address of the TEST_AXI device.
 *
 * @return  None.
 *
 * @note    None.
 *
 */
void AXI_INTERRUPT_EnableInterrupt(void * baseaddr_p)
{
  Xuint32 baseaddr;
  baseaddr = (Xuint32) baseaddr_p;

  /*
   * Enable all interrupt source from user logic.
   */
  AXI_INTERRUPT_mWriteReg(baseaddr, AXI_INTERRUPT_INTR_IPIER_OFFSET, 0x00000003);

  /*
   * Set global interrupt enable.
   */
  AXI_INTERRUPT_mWriteReg(baseaddr, AXI_INTERRUPT_INTR_DGIER_OFFSET, INTR_GIE_MASK);
}

/**
 *
 * Example interrupt controller handler for TEST_AXI device.
 * This is to show example of how to toggle write back ISR to clear interrupts.
 *
 * @param   baseaddr_p is the base address of the TEST_AXI device.
 *
 * @return  None.
 *
 * @note    None.
 *
 */
unsigned int t=0;
void AXI_INTERRUPT_VsyncIntr_Handler(void * baseaddr_p)
{
	static void (*funcPtr_CPU1proc)() = CPU1_ISR;
	debug_frameNo++;


	if (cpu0_busy_processing_frame == 1) {
#if NUM_CPUS==2
		if (cpu1_busy_processing_frame == 0) {
			cpu1_busy_processing_frame = 1;
			// interrupt cpu1 to start processing this frame
			Xil_Out32(0xfffffff0, (u32) funcPtr_CPU1proc);
			sev();
		} // else skip frame
#endif
	} else {
		cpu0_busy_processing_frame = 1;
		// interrupt cpu0 to start processing this frame
		FRAME_INTR = 1;
	}
}



void AXI_INTERRUPT_HrefIntr_Handler(void * baseaddr_p)
{
  static int cnt = 0;
  cnt++;
  imageRow++;
}


void AXI_INTERRUPT__VDMA1_S2MMIntr_Handler(void * baseaddr_p)
{
	Xil_Out32((XPAR_AXI_VDMA_1_BASEADDR + AXI_FILTER_RX_CTRL), 0x00000004); // Mun
	GRAY_INTR = 1;
}


