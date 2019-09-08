/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */
/*
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"


int main()
{
    init_platform();

    print("Hello World\n\r");

    cleanup_platform();
    return 0;
}
*/

/******************************************************************************/
/*                                                                            */
/* main.c -- PmodTMP3 example project                                         */
/*                                                                            */
/******************************************************************************/
/* Author: Arthur Brown                                                       */
/* Copyright 2016, Digilent Inc.                                              */
/******************************************************************************/
/* Module Description:                                                        */
/*                                                                            */
/* This file contains code for running a demonstration of the PmodTMP3 when   */
/* used with the PmodTMP3 IP core.                                            */
/*                                                                            */
/******************************************************************************/
/* Revision History:                                                          */
/*                                                                            */
/*    06/09/2016(ABrown):   Created                                           */
/*    05/08/2017(jPeyron):  Updated                                           */
/*    11/10/2017(atangzwj): Validated for Vivado 2016.4                       */
/*    01/13/2018(atangzwj): Validated for Vivado 2017.4                       */
/*                                                                            */
/******************************************************************************/

#include "PmodTMP3.h"
#include "sleep.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"

void DemoInitialize();
void DemoRun();
void DemoCleanup();
void EnableCaches();
void DisableCaches();

PmodTMP3 myDevice;

int main(void) {
   DemoInitialize();
   DemoRun();
   DemoCleanup();
   return 0;
}

void DemoInitialize() {
   EnableCaches();

   xil_printf("\x1B[H");  // Move terminal cursor to top left
   xil_printf("\x1B[1K"); // Clear terminal
   xil_printf("Connected to PmodTMP3 Demo over UART\n\r");

   TMP3_begin(&myDevice, XPAR_PMODTMP3_0_AXI_LITE_IIC_BASEADDR, TMP3_ADDR);
   xil_printf("Connected to PmodTMP3 over IIC on JB\n\r\n\r");
}

void DemoRun() {
   double temp  = 0.0;
   double temp2 = 0.0;
   double temp3 = 0.0;

   while (1) {
      temp  = TMP3_getTemp(&myDevice);
      temp2 = TMP3_CtoF(temp);
      temp3 = TMP3_FtoC(temp2);

      int temp2_round = 0;
      int temp2_int   = 0;
      int temp2_frac  = 0;
      // Round to nearest hundredth, multiply by 100
      if (temp2 < 0) {
         temp2_round = (int) (temp2 * 1000 - 5) / 10;
         temp2_frac  = -temp2_round % 100;
      } else {
         temp2_round = (int) (temp2 * 1000 + 5) / 10;
         temp2_frac  = temp2_round % 100;
      }
      temp2_int = temp2_round / 100;

      int temp3_round = 0;
      int temp3_int   = 0;
      int temp3_frac  = 0;
      if (temp3 < 0) {
         temp3_round = (int) (temp3 * 1000 - 5) / 10;
         temp3_frac  = -temp3_round % 100;
      } else {
         temp3_round = (int) (temp3 * 1000 + 5) / 10;
         temp3_frac  = temp3_round % 100;
      }
      temp3_int = temp3_round / 100;

      xil_printf("Temperature: %d.%d in Fahrenheit\n\r", temp2_int, temp2_frac);
      xil_printf("Temperature: %d.%d in Celsius\n\r", temp3_int, temp3_frac);
      print("\n\r");
      sleep(1); // Delay
   }
}

void DemoCleanup() {
   TMP3_end(&myDevice);
   xil_printf("PmodTMP3 Disconnected\n\r");
   xil_printf("Closing UART Connection\n\r");
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}


