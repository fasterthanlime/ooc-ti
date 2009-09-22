/******************************************************************************
*                                                                             
* T I C T   T U T O R I A L S                                                 
*                                                                                                                                                         
* Executive Editor: thomas.nussbaumer@gmx.net                                 
* Homepage:         http://go.to/tichess                                      
*                                                                                                                                                          
* ----------------------------------------------------------------------------- 
*                                                                                                                                                                                                                                       
* SERIES 1 - Basic Techniques                                                 
*                                                                             
* PART I: Handling Uncompressed Images in C-Projects  v 1.00                  
*
* Release Date: 14/08/2000                                                    
*                                                                                                                                                          
* ----------------------------------------------------------------------------- 
*                                                                                                                                                                                                                                       
* build this program by typing: tigcc -O2 showimg.c
*
* 0xId: showimg.c,v 1.1 2000/08/13 23:52:51 Thomas Nussbaumer Exp 0x
*
******************************************************************************/include ./flags

/*---------------------------------------------------------------------------*/
/* includes (NOTE: I don't use all.h, but include just the necessary files)  */
/*---------------------------------------------------------------------------*/
include nostub      // necessary for the nostub stuff
include gray        // for the grayscale routines
include kbd         // for ngetchx()
include graph       // for LCD_WIDTH definition
include compat      // for the TI89 definition
include mem         // for memset() and memcpy()

/*---------------------------------------------------------------------------*/
/* global variables                                                          */
/*---------------------------------------------------------------------------*/
_ti92plus: Int          // needed to produce ti92plus code
_ti89: Int              // needed to produce ti89 code


/*---------------------------------------------------------------------------*/
/* image data for bitplane 1                                                 */
/*---------------------------------------------------------------------------*/
layer1 : UChar[] = [
  0xff,0xff,0xff,0xff,0x78,0xda,0xcf,0xbf,0xff,0xff,0xff,0xff,0x13,0xb9,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x5e,0xf0,0x5f,0xff,0xff,0xff,0xff,0xff,0x7f,0x7d,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xbe,0xf9,0x4f,0xff,0xff,0xff,0xff,0xfe,0x67,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xbe,0x7f,0x7e,0xff,0xff,0xff,0xff,0xf8,0x77,0xf3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x3f,0x7e,0xcf,0x7f,0xff,0xff,0xff,0xfc,0x7f,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xbf,0xfe,0xaf,0xff,0xff,0xff,0xff,0xf4,0xaf,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xbf,0xbd,0xa6,0xff,0xff,0xff,0xff,0xe0,0xaf,0xef,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x9e,0xff,0xa7,0xff,0xff,0xff,0xff,0xe1,0x3f,0xdb,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x9e,0x3d,0xf3,0xff,0xff,0xff,0xff,0xd1,0x67,0xdb,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x9f,0xbf,0xfb,0xff,0xff,0xff,0xf7,0xc3,0xbf,0x9b,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x8f,0x92,0xd1,0xff,0xff,0xff,0xfb,0x83,0x3f,0x5f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xfe,0xef,0xf1,0xdc,0xff,0xff,0xff,0xfd,0xc2,0xef,0xb7,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xcf,0xfd,0xfc,0xff,0xff,0xff,0xfe,0x03,0x7f,0x77,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf7,0xfd,0xe0,0xff,0xff,0x8f,0xfe,0x01,0x7f,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe7,0xfe,0xea,0x3f,0xff,0x01,0xfe,0x00,0xbf,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf3,0xfe,0xec,0x7f,0x7f,0x00,0x32,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf1,0xfe,0xff,0x3f,0x0e,0x00,0x00,0x04,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfb,0xfe,0xff,0x84,0x00,0x00,0x00,0x05,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf0,0xff,0x4f,0x80,0x00,0x00,0x00,0x07,0xfe,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf9,0xff,0xc7,0x40,0x00,0x00,0x00,0x01,0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0xff,0xcc,0x80,0x00,0x00,0x00,0x00,0x7f,0xf5,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x7f,0xe8,0x00,0x00,0x00,0x00,0x00,0x7c,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x3f,0x40,0x00,0x00,0x00,0x00,0x00,0x1c,0xeb,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfb,0x3f,0x80,0x00,0x00,0x20,0x00,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfd,0x3b,0x00,0x00,0x02,0x00,0x00,0x60,0x00,0x5f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x0f,0x00,0x01,0xf0,0x00,0x36,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf7,0x80,0x00,0x00,0x0f,0x0c,0x03,0xf0,0x00,0x15,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xeb,0xc0,0x00,0x00,0x3f,0x8c,0x07,0xfc,0x00,0x1b,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0x80,0x00,0x18,0x1f,0x1c,0x7d,0xfc,0x00,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe7,0x00,0x00,0x40,0x3f,0x9e,0x7d,0xfe,0x01,0x09,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfd,0x00,0x00,0xb0,0x7f,0xdf,0xc3,0xfd,0xcf,0x03,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x00,0x02,0x80,0x7f,0xff,0xbf,0xfd,0xef,0xa5,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x01,0x03,0x80,0x7f,0xff,0xef,0xff,0xdf,0xd3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x0a,0x48,0x00,0xff,0xbf,0xc7,0xff,0xdf,0xe1,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xee,0x0f,0xf9,0x00,0x7f,0xbd,0x8f,0xff,0x9f,0xf3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf4,0x0f,0xe1,0xc0,0x7f,0xfb,0x9f,0xff,0xbf,0xe8,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x1f,0xdf,0x00,0xff,0xfb,0x1f,0xfe,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf0,0x3f,0xef,0x83,0xfd,0xff,0xff,0xff,0x7f,0xff,0x7f,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe0,0x3f,0xfd,0x07,0xe9,0xef,0xff,0xf3,0xef,0xde,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x1f,0xed,0x07,0x40,0xbf,0xff,0xfd,0x7f,0xe5,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x5f,0xde,0x00,0x00,0x7f,0xff,0xfe,0xef,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xfc,0x00,0x00,0x0f,0xfe,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xb6,0x00,0x00,0x07,0xfa,0x00,0x07,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xf6,0x00,0x00,0x0f,0xf8,0x00,0x02,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfd,0xf2,0x00,0x00,0x0f,0xf0,0x00,0x03,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf7,0xe4,0x00,0x00,0x0b,0xc0,0x00,0x01,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0xb8,0x00,0x00,0x3f,0x40,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xdf,0xe0,0x00,0x00,0x15,0x40,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xef,0x60,0x00,0x00,0x1b,0x80,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x1a,0x80,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xdd,0xc0,0x00,0x00,0x3f,0xc0,0x00,0x1c,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xbf,0x80,0x02,0x00,0x1b,0xe0,0x00,0x03,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x00,0x05,0x00,0x1f,0xf8,0x00,0x03,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0xff,0x2c,0x0f,0xe0,0x1b,0xff,0xc0,0x0f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x48,0x10,0xe0,0x1b,0xba,0x40,0x17,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x48,0x1c,0x00,0x1f,0xbd,0x80,0x0f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x58,0x0c,0x02,0xff,0xfc,0x01,0xff,0xef,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xa4,0x15,0x00,0x67,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x84,0x3a,0x00,0x63,0xff,0x3f,0xed,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x38,0x01,0xdf,0xff,0xe0,0x5b,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x88,0x28,0x63,0x9f,0xdf,0xf1,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc8,0x24,0x00,0xdf,0xff,0xe1,0xfd,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x5f,0x80,0x99,0xef,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc8,0xe0,0x09,0xf7,0xf9,0xff,0xf3,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc8,0x80,0x0b,0x77,0xfe,0xff,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x88,0x00,0xed,0xff,0xef,0xe1,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x01,0x3f,0xbf,0xff,0xff,0xfc,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x02,0xbf,0xf9,0xff,0xff,0x81,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xe4,0x46,0x7e,0xe7,0xf7,0xff,0x7b,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xe2,0x2f,0xde,0x5f,0xdf,0xff,0x73,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x1f,0xc3,0x9f,0xdf,0xf7,0x77,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x1d,0xff,0xff,0xff,0xff,0xf6,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xe2,0x1f,0x0f,0xdf,0xff,0xff,0x76,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xe0,0x1f,0xf7,0xdf,0xff,0xff,0x78,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x0f,0xff,0xbf,0xff,0xff,0xf6,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x0f,0x3f,0xff,0xfb,0xf6,0xf7,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x7f,0x9f,0x5f,0xbb,0xeb,0xf7,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x35,0xfb,0x7f,0x7f,0x0d,0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x86,0xff,0x9b,0xfe,0x4c,0x76,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc6,0x62,0xfb,0xbf,0xfe,0x47,0x3b,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc2,0x71,0x7f,0x47,0x60,0x47,0x2f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x83,0x71,0xbf,0x7e,0x44,0x27,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc1,0xd0,0xbf,0xfc,0x44,0x6e,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc1,0x99,0xff,0xfd,0xfd,0xfd,0xcd,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0xc8,0xef,0xf7,0xff,0xf3,0x4f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0xc8,0x6c,0xff,0xff,0x8e,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x68,0xff,0x7f,0xff,0x7d,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x1c,0x1f,0x86,0xfb,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x02,0x6f,0xbf,0x6f,0xef,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x0b,0xf3,0x7f,0xdf,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x00,0x03,0xf0,0x3f,0xde,0x7d,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x00,0x01,0xe7,0x8e,0x18,0xf6,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf8,0x00,0x01,0xff,0xc5,0xc7,0xdd,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf8,0x00,0x10,0x7f,0xff,0xc1,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf8,0x00,0x38,0x7b,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf8,0x00,0x30,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfc,0x00,0x02,0xbf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x07,0xbf,0xff,0xff,0xef,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xd0,0x00,0x07,0x7f,0xff,0xff,0xef,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
]                                                                               
                                                                                

/*---------------------------------------------------------------------------*/
/* image data for bitplane 2                                                 */
/*---------------------------------------------------------------------------*/
layer2 : UChar[] = [
  0xff,0xff,0xff,0xfe,0x3f,0xe5,0x9f,0xff,0xff,0xff,0xcf,0xfe,0x2f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x3f,0xff,0xdf,0xbf,0xff,0xff,0xf7,0xfc,0x0f,0xfb,0xf3,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x1f,0xfe,0xdf,0x5f,0xff,0xff,0xff,0xfc,0x1f,0xf9,0xf3,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x3f,0xfe,0xcf,0x7f,0xff,0xff,0xff,0xfc,0x0f,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xbf,0xff,0x6f,0xff,0xff,0xff,0xff,0xf8,0x8f,0xf3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x1f,0xff,0x67,0x9f,0xff,0xff,0xff,0xf8,0x1f,0xf3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x9f,0xfe,0x67,0x1f,0xff,0xff,0xef,0xf8,0x9f,0xf3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x8f,0xfe,0x77,0xff,0xff,0xff,0xc7,0xf1,0x9f,0xe7,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xcf,0xfe,0x33,0xff,0xff,0xff,0xff,0xe1,0x9f,0xe7,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xcf,0xfe,0x33,0xff,0xff,0xff,0xff,0xe1,0x0f,0xe7,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0x8f,0xff,0x39,0xff,0xff,0xff,0xff,0xe3,0x0f,0xa7,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xfe,0xc7,0xfe,0x38,0xff,0xff,0xff,0xff,0x83,0x1f,0x4f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xfd,0xe7,0xfe,0x18,0xff,0xff,0xff,0xff,0x02,0x1f,0x8f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe7,0xfe,0x1c,0xff,0xff,0xff,0xff,0x02,0x1f,0xcf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf3,0xff,0x1c,0x3f,0xff,0x00,0xfe,0x02,0x7f,0xdf,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf3,0xff,0x1e,0x1f,0xbe,0x00,0x74,0x02,0x3f,0x9f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf3,0xff,0x0e,0x1f,0x1c,0x00,0x00,0x02,0x7f,0x9f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe1,0xff,0x0f,0x38,0x00,0x00,0x00,0x02,0x7f,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf9,0xff,0xbf,0x80,0x00,0x00,0x00,0x00,0xff,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0xff,0xff,0x80,0x00,0x00,0x00,0x00,0x7f,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0xff,0xf3,0x00,0x00,0x00,0x00,0x00,0xde,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x7f,0xc0,0x00,0x00,0x00,0x00,0x00,0x3e,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x7f,0xe0,0x00,0x00,0x00,0x00,0x00,0x08,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x3f,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x1c,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x2f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf7,0x10,0x00,0x00,0x06,0x00,0x00,0xe0,0x00,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe7,0x00,0x00,0x00,0x1f,0x00,0x01,0xf8,0x00,0x0f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xfd,0xe7,0x80,0x00,0x00,0x1f,0x00,0x01,0xf8,0x00,0x0f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xfe,0x7f,0x80,0x00,0x00,0x3f,0x80,0x03,0xfc,0x00,0x07,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xfc,0xe7,0x00,0x00,0x30,0x7f,0x80,0x03,0xfc,0x00,0x07,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x40,0x7f,0x80,0x3f,0xfe,0x27,0x87,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x00,0x01,0xc0,0x7f,0x80,0x7f,0xfe,0x3f,0xc3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x00,0x01,0xc0,0x7f,0x80,0x7f,0xfe,0x3f,0xe7,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfe,0x07,0x80,0x00,0x7f,0xc0,0x7f,0xfe,0x3f,0xc3,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x0f,0xc1,0x80,0xff,0xc2,0x7f,0xfe,0x7f,0xe1,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x0f,0xff,0x80,0xff,0xc6,0x7f,0xfe,0x7f,0xf1,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xfc,0x3f,0xff,0x80,0xff,0xc7,0xff,0xff,0x3f,0xf0,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x7f,0xff,0x01,0xff,0xc3,0xff,0xff,0x9f,0xe0,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf0,0x7f,0xff,0x03,0xf0,0x7f,0xff,0xff,0x9f,0xe1,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xe0,0x3f,0xf2,0x07,0x80,0x7f,0xff,0xfe,0x9f,0xfb,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xf8,0x3f,0xe0,0x06,0x00,0x0f,0xff,0xff,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x00,0x00,0x07,0xff,0x20,0x07,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x00,0x00,0x07,0xfc,0x00,0x03,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x00,0x00,0x07,0xf0,0x00,0x03,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfb,0x04,0x00,0x00,0x07,0x80,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf9,0x10,0x00,0x00,0x07,0x80,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf3,0x40,0x00,0x00,0x03,0x80,0x00,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xe0,0x40,0x00,0x00,0x0b,0x80,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf0,0xc0,0x00,0x00,0x07,0x00,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0x9c,0xc0,0x00,0x00,0x07,0x00,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x00,0x07,0x80,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0x7e,0x00,0x02,0x00,0x03,0xc0,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x00,0x07,0xc0,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x38,0x0f,0x00,0x07,0xc1,0x80,0x08,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x38,0x0e,0x00,0x03,0xc0,0x00,0x10,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xb8,0x1e,0x00,0x07,0xc0,0x00,0x00,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x98,0x0e,0x00,0x1f,0xe0,0x00,0x00,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x98,0x04,0x00,0x1f,0xc0,0xc0,0x1e,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x00,0x00,0x21,0xc0,0x1f,0xbc,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x10,0x00,0x61,0xe0,0x0f,0xfc,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x18,0x00,0x21,0xe0,0x1f,0xfe,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x20,0x00,0x67,0xf1,0xff,0xfc,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x00,0x00,0x0f,0xff,0xff,0xfc,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x00,0x00,0x8f,0xf9,0xff,0xe0,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x80,0x03,0x8f,0xf0,0x1e,0x00,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x80,0xc3,0xdf,0xe0,0x00,0x03,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x01,0xc7,0xfe,0x00,0x00,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x01,0x8f,0xf8,0x18,0x00,0xfd,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x30,0x3f,0xe0,0x38,0x00,0xfd,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xe0,0x38,0x3c,0x60,0x38,0x08,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xe0,0x1e,0x00,0x60,0x38,0x08,0x79,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x1f,0xf0,0xe0,0x38,0x08,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x0f,0xf8,0xe0,0x38,0x08,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x0f,0xf8,0x40,0x38,0x00,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x0f,0xf8,0x40,0x3c,0x09,0xf8,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x1f,0xf8,0xe0,0x7c,0x1d,0xf8,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x63,0xdc,0xe0,0xfc,0xff,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x41,0xf8,0x67,0xff,0xff,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc2,0x01,0xfc,0x47,0xff,0xff,0xfd,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x82,0x00,0xff,0xff,0xff,0xff,0xf1,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x82,0x00,0x7f,0xff,0xff,0xff,0xc1,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x81,0x60,0x7f,0xff,0xff,0xff,0x81,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc1,0xe0,0x1f,0xff,0xff,0xfe,0x33,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0xf0,0x1f,0xff,0xff,0xfc,0xb3,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0xc0,0x70,0x13,0xff,0xff,0xf1,0xf7,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x30,0x00,0xff,0xff,0x83,0xe7,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x30,0x60,0x7f,0xfc,0x07,0xcf,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x1c,0x30,0x40,0xf0,0x1f,0x9f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x80,0x04,0x0c,0x80,0x20,0x3f,0x3f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x0f,0xc0,0x21,0xbe,0x7f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x1a,0x71,0xe7,0xf9,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf0,0x00,0x00,0x00,0x3b,0xff,0xe3,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf8,0x00,0x00,0x00,0x01,0xfe,0x07,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf0,0x00,0x00,0x04,0x00,0x00,0x07,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf8,0x00,0x00,0x00,0x00,0x00,0x07,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xf3,0x00,0x00,0x00,0x00,0x00,0x0f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00,0x00,0x0f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xfe,0x00,0x00,0x40,0x00,0x00,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,  0xff,0xff,0xff,0xff,0xff,0xc0,0x00,0x00,0x00,0x00,0x00,0x1f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
]
TI89: extern Bool
GRAY_OFF, GRAY_ON: extern IntLCD_SIZE: extern SizeTGrayMode: extern func (Int) -> BoolGetPlane: extern func (Int) -> UChar*ngetchx: extern func

/*===========================================================================*/
/* main routine: where all the fun starts ...                                */
/*===========================================================================*/
_main: func {	plane1, plane2, dest1, dest2, src1, src2 : UChar*
    
    //-----------------------------------------------
    // turn on grayscale graphics subsystem
    //-----------------------------------------------
    if (!GrayMode(GRAY_ON)) {
        return
    }

    //-----------------------------------------------
    // fetch start addresses of planes
    //-----------------------------------------------
    plane1 = GetPlane(0)
    plane2 = GetPlane(1)

    //-----------------------------------------------
    // due to the fact that the LCD size of the TI89
    // is internally the same than the LCD size of 
    // the TI92 we cannot directly copy the complete
    // contents of the layer1 and layer2 arrays into
    // the bitplanes, but we have to copy each line
    // separately taking the offsets at each line
    // into account
    //-----------------------------------------------

    dest1 = plane1
    dest2 = plane2
    src1  = layer1
    src2  = layer2

    //-----------------------------------------------
    // on the TI92 we have to clear both bitplanes
    // because the skipped parts will be visible
    //
    // additionally we have to add an initial offset
    // to the destination pointers
    //-----------------------------------------------
    if (!TI89) {
        memset(plane1, 0, LCD_SIZE)
        memset(plane2, 0, LCD_SIZE)

        //-------------------------------------------
        // setup the destination pointers taking the 
        // initial offset into account
        // (each line consists of 30 bytes on a TI92)
        //-------------------------------------------
        dest1 += ((128-100)*30)/2 + ((240-160)/8)/2
        dest2 += ((128-100)*30)/2 + ((240-160)/8)/2
    }

    //-----------------------------------------------
    // ... and now copy all lines from the data 
    // arrays to the bitplanes
    //-----------------------------------------------
    for (loop in 0..100) {
        memcpy(dest1,src1,20)
        memcpy(dest2,src2,20)		src1+=20		src2+=20		dest1+=30		dest2+=30
    }
    
                
    //-----------------------------------------------
    // wait that the user presses a key ...
    //-----------------------------------------------
    ngetchx()

    //-----------------------------------------------
    // cleanup and bye =8-)
    //-----------------------------------------------
    GrayMode(GRAY_OFF)
}

//#############################################################################
//###################### NO MORE FAKES BEYOND THIS LINE #######################
//#############################################################################
//
//=============================================================================
// Revision History
//=============================================================================
//
// 0xLog: showimg.c,v 0x
// Revision 1.1  2000/08/13 23:52:51  Thomas Nussbaumer
// initial version
//
//
//
//
