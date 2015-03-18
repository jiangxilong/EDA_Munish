/*
 * sw_functions.h
 *
 *  Created on: Feb 12, 2014
 *      Author: ga73koz
 */

#ifndef SW_FUNCTIONS_H_
#define SW_FUNCTIONS_H_

/*void ConvToGray(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,
		unsigned short horizontalActiveTime);*/

void ConvToGrayHLS(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,
		unsigned short horizontalActiveTime);

void EdgeDetection(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,
		unsigned short width, unsigned short height, unsigned short h_ActiveTime);

unsigned char rgb2y(unsigned char R, unsigned char G, unsigned char B);

void SampleFunction(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,
		unsigned short horizontalActiveTime);

#endif /* SW_FUNCTIONS_H_ */
