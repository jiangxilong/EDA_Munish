// this is going to be auto-generated via template engine and later customized by IP supplier

#include "GrayscaleIP_Driver.h"
#include "xil_assert.h"

void GrayscaleIP_Driver_WriteReg(unsigned int addr, unsigned int mask, unsigned int value) {
    // only write to reg if mask != 0
    if ((mask | 0x0) != 0x0) {
        *((volatile unsigned int *)(addr)) = (*(volatile unsigned int *)(addr) & ~(mask)) | value;
    }
}


unsigned int GrayscaleIP_Driver_ReadReg(unsigned int addr) {
    return (unsigned int) *((volatile unsigned int *)(addr));
}


// updates the Grayscale IP peripheral's memory mapped registers with content provided in mode 
static void SetHAMode(GrayscaleIP_RegMap *mode, unsigned int baseaddr) {
	// pointing to 1st register in passed regmap
	RegType *iter_ptr = (RegType *) mode;
	// getting the number of the registers in the passed reg-map
	int reg_in_regmap = sizeof(GrayscaleIP_RegMap)/sizeof(RegType);
	// iterating over all registers in the passed regmap
	int i=0;
	for (i=0; i<reg_in_regmap; i++) {
		GrayscaleIP_Driver_WriteReg(baseaddr + iter_ptr->offset, iter_ptr->mask, iter_ptr->value);
		iter_ptr++;
	}
}


void GrayscaleIP_Driver_initialize(GrayscaleIP_DriverInstance *InstancePtr, XScuGic *InterruptController, GrayscaleIP_RegMap InitMode, unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,unsigned short width, unsigned short height, unsigned short horizontalActiveTime, unsigned short verticalActiveTime) {
	SetHAMode(&InitMode, InstancePtr->baseaddr);
	
    // registering this IP's ISR with the Interrupt Controller passed on by the application developer
	int Status = XScuGic_Connect(InterruptController, InstancePtr->intr_id, (Xil_ExceptionHandler) GrayscaleIP_Driver_ISR, (void *) InstancePtr);
	if (Status != XST_SUCCESS) {
		Xil_AssertVoid(0);
	}
	XScuGic_Enable(InterruptController, InstancePtr->intr_id);	
	
	InstancePtr->busy = 0;
}



void GrayscaleIP_Driver_start(GrayscaleIP_DriverInstance *InstancePtr, GrayscaleIP_RegMap StartMode, unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,unsigned short width, unsigned short height, unsigned short horizontalActiveTime, unsigned short verticalActiveTime) {
    SetHAMode(&StartMode, InstancePtr->baseaddr);
    InstancePtr->busy = 1;
}



void GrayscaleIP_Driver_stop(GrayscaleIP_DriverInstance *InstancePtr, GrayscaleIP_RegMap StopMode) {
	SetHAMode(&StopMode, InstancePtr->baseaddr);
}



bool GrayscaleIP_Driver_isBusy(GrayscaleIP_DriverInstance *InstancePtr) {
	return InstancePtr->busy;
}



void GrayscaleIP_Driver_ISR(void *baseaddr_p) {
	GrayscaleIP_DriverInstance *InstancePtr = (GrayscaleIP_DriverInstance *) baseaddr_p;
	InstancePtr->busy = 0;
}







