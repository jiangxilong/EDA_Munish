
/******************************************************************************/
/***************************** Include Files **********************************
/******************************************************************************/
#include <stdio.h>
#include "xil_io.h"
#include "xparameters.h"
#include "cf_hdmi.h"
#include "sw_functions.h"
#include "xil_cache.h"
#include "xdmaps.h"
#include "profile_cnt.h"

/******************* Macros and Constants Definitions ************************/

#define ABS(x)		(x < 0 ? -x : x)

/* ******************* ConvToGrayHLS *******************
 * Imitating the Vivado_HLS implementation of grayscale conversion
 * Reads an Image frame from DDR memory, Converts the Raw image
 * to Gray scale and writes back to DDR memory at a different location 
 */
 void ConvToGrayHLS(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,unsigned short horizontalActiveTime)
{
	int 	i,j,V_offset;
	int    	cols = 640;
	int   	rows = 480;
	float 	_par[3] = {0.114,0.587,0.299};

	int _s;	// src pixel
	int _d;	// dst pixel
	int b,g,r,c;

	V_offset = 0;
	for(i = 0; i < rows; i++) {
		for (j = 0; j < cols; j++) {
			_s = Xil_In32(ImgIn_BaseAddr + ((V_offset + j) * 4) ); //Get the colored image pixel
			//apply kernel
			r = _par[0] * ( _s & 0xff );
			b = _par[1] * ((_s & 0xff00) >> 8);
			g = _par[2] * ((_s & 0xff0000) >> 16);
			c = r + g + b;
			if(c>255)
			{
				c=255;
			}
			_d = (c & 0xff) | ((c & 0xff) << 8) | ((c & 0xff) << 16) ;
			Xil_Out32( ImgOut_BaseAddr + ((V_offset + j) * 4 ), _d ); //write to another location gray pixel
		}
		V_offset = V_offset + horizontalActiveTime;
	}
}
 
/* ******************* EdgeDetection *******************
 * Get an Image frame from DDR memory and perform Edge Detection on this
 * Store the processed Image back to DDR at a different location
 */
void EdgeDetection(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,
		unsigned short width, unsigned short height, unsigned short h_ActiveTime)
{
	short x_weight, y_weight, edge_weight;
	unsigned char edge_val;
	unsigned char in_R, in_G, in_B;
	int pix_i = 0, pix_j = 0;
	u32 pixel_temp;

	/* Clearing 0th row : Sobel filter is not applied on 0th ROW: to have consistent data flow */
	for(pix_j = 0; pix_j < width; pix_j++)
	{
		Xil_Out32( ImgOut_BaseAddr + (pix_j * 4) , 0x0 );
	}

	/* move initial(i-1 & i) 2-rows of RGB pixel data into line buffers after conv. into Y(luminance) */
	pix_i = 0;
	for(pix_j = 0; pix_j < width ; pix_j++)
	{
		pixel_temp = Xil_In32(ImgIn_BaseAddr + (pix_i * h_ActiveTime + pix_j) * 4); //Get the original image's pixel
		in_B = (pixel_temp & 0x000000FF);
		in_G = ((pixel_temp >>8 ) & 0x000000FF);
		in_R = ((pixel_temp >>16) & 0x000000FF);
		line_buffer[0][pix_j]  = rgb2y(in_R, in_G, in_B) ;
	}
	pix_i = 1;
	for(pix_j = 0; pix_j < width ; pix_j++)
	{
		pixel_temp = Xil_In32(ImgIn_BaseAddr + (pix_i * h_ActiveTime + pix_j) * 4); //Get the original image's pixel
		in_B = (pixel_temp & 0x000000FF);
		in_G = ((pixel_temp >>8 ) & 0x000000FF);
		in_R = ((pixel_temp >>16) & 0x000000FF);
		line_buffer[1][pix_j]  = rgb2y(in_R, in_G, in_B) ;
	}

	for(pix_i = 1; pix_i < height-1; pix_i++) /* -1 as we read from pix_i+1 th row*/
		{	/* copy (pix_i) row into line_buffer, i.e: line_buffer[2] <-- row[pix_i] */
			for(pix_j = 0; pix_j < width ; pix_j++)
			{
				pixel_temp = Xil_In32(ImgIn_BaseAddr + ((pix_i+1) * h_ActiveTime + pix_j) * 4); //Get the original image's pixel
				in_B = (pixel_temp & 0x000000FF);
				in_G = ((pixel_temp >>8 ) & 0x000000FF);
				in_R = ((pixel_temp >>16) & 0x000000FF);
				line_buffer[2][pix_j]  = rgb2y(in_R, in_G, in_B) ;
			}

			Xil_Out32( (ImgOut_BaseAddr + (pix_i * h_ActiveTime + 0) * 4) , 0x0 ); // making first pixel zero.

			/* compute Sobel filtering over (pix_i - 1) pixels, i.e: sobel_filtering(&line_buffer[1][0])*/
			for(pix_j = 1; pix_j < width-1  ; pix_j++)
			{
				x_weight =  line_buffer[0][pix_j-1]*(-1) + line_buffer[0][pix_j+1]	 + line_buffer[1][pix_j-1]*(-2) + line_buffer[1][pix_j+1]*(2) 	+ line_buffer[2][pix_j-1]*(-1) + line_buffer[2][pix_j+1] ;
				y_weight =  line_buffer[0][pix_j-1]	     + line_buffer[0][pix_j]*(2) + line_buffer[0][pix_j+1] 		+ line_buffer[2][pix_j-1]*(-1)  + line_buffer[2][pix_j]*(-2)   + line_buffer[2][pix_j+1]*(-1) ;
				edge_weight = ABS(x_weight) + ABS(y_weight);
				//Added RGB fix-06-dec-12
				if(edge_weight < 255)
					edge_val = (255-(unsigned char)(edge_weight));
				else
					edge_val = 0;

				if(edge_val > 200)
					edge_val = 255;
				else if(edge_val < 100)
					edge_val = 0;
				pixel_temp = (edge_val) | (edge_val<<8) | (edge_val<<16) | 0xFF000000 ;
				// write the edge value into RGB
				Xil_Out32( (ImgOut_BaseAddr + (pix_i * h_ActiveTime + pix_j) * 4) , pixel_temp );

			}	/* --Sobel_filtering(row[pix_i - 1]) complete */

			/* copy the history of pixel data */
			/* row[pix_i - 2] <-- row[pix_i - 1], i.e: line_buf[0] <-- line_buf[1] */
			/* row[pix_i - 1] <-- row[pix_i], i.e: line_buf[1] <-- line_buf[2] */
			for(pix_j = 0; pix_j < (width /* PBJ no need of '+ 1' */); pix_j++)
			{
				line_buffer[0][pix_j] = line_buffer[1][pix_j] ;
				line_buffer[1][pix_j] = line_buffer[2][pix_j] ;
			}
		}

}


unsigned char rgb2y(unsigned char R, unsigned char G, unsigned char B)
{
	unsigned char y;
	y = ((66 * R + 129 * G + 25 * B + 128) >> 8) + 16;
	return y;
}

/******************** SampleFunction ********************/
/* Takes the Raw image from DDR image space
 * converts it to Gray scale and writes back to DDR
 * at a different location
 * Optimized implementation of Gray scale filter, according to an optimal algorithm
 */
void SampleFunction(unsigned long ImgIn_BaseAddr,unsigned long ImgOut_BaseAddr,
		unsigned short horizontalActiveTime)
{
	u32 row,col;
	u32 V_offset, VH_offset;
	u32 pixel_color,pixel_temp,pixel_gray;

	  for (row = 0; row < 480 ;row++) {
		  V_offset = row * horizontalActiveTime;

	  	  for (col = 0; col < 640 ;col++) {
	  		{
					pixel_color	= Xil_In32(ImgIn_BaseAddr + (V_offset + col) * 4); //Get the colored image
					pixel_temp 	= (int)(((pixel_color & 0xff) + ((pixel_color & 0xff00) >> 8) + ((pixel_color & 0xff0000) >> 16)) / 3); // convert to gray
					pixel_gray 	= (pixel_temp & 0xff) | ((pixel_temp & 0xff) << 8) | ((pixel_temp & 0xff) << 16) ;
					Xil_Out32( ImgOut_BaseAddr + ((V_offset+col) * 4) , pixel_gray ); // write to another location
	  		}
	  	  }
	  	}
}


