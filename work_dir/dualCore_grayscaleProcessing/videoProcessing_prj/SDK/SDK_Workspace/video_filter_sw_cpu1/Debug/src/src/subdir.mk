################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/src/axi_interrupt.c \
../src/src/cf_hdmi.c \
../src/src/main.c \
../src/src/sw_functions.c \
../src/src/transmitter.c 

OBJS += \
./src/src/axi_interrupt.o \
./src/src/cf_hdmi.o \
./src/src/main.o \
./src/src/sw_functions.o \
./src/src/transmitter.o 

C_DEPS += \
./src/src/axi_interrupt.d \
./src/src/cf_hdmi.d \
./src/src/main.d \
./src/src/sw_functions.d \
./src/src/transmitter.d 


# Each subdirectory must supply rules for building sources it contributes
src/src/%.o: ../src/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -I"/nfs/TUEIEDAprojects/SystemDesign/work/zynq/mamatha/uzair_sharif/EDA_Munish/work_dir/dualCore_grayscaleProcessing/videoProcessing_prj/SDK/SDK_Workspace/video_filter_sw_cpu1/src/inc" -c -fmessage-length=0 -I../../standalone_amp_bsp_0/ps7_cortexa9_1/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


