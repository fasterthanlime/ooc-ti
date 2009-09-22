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
******************************************************************************/

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
  0xff,0xff,0xff,0xff,0x78,0xda,0xcf,0xbf,0xff,0xff,0xff,0xff,0x13,0xb9,0xff,0xff,0xff,0xff,0xff,0xff,
]                                                                               
                                                                                

/*---------------------------------------------------------------------------*/
/* image data for bitplane 2                                                 */
/*---------------------------------------------------------------------------*/
layer2 : UChar[] = [
  0xff,0xff,0xff,0xfe,0x3f,0xe5,0x9f,0xff,0xff,0xff,0xcf,0xfe,0x2f,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
]

GRAY_OFF, GRAY_ON: extern Int

/*===========================================================================*/
/* main routine: where all the fun starts ...                                */
/*===========================================================================*/
_main: func {
    
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
        memcpy(dest2,src2,20)
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