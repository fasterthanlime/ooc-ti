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
include peekpoke    // for pokeIO_bset

/*---------------------------------------------------------------------------*/
/* global variables                                                          */
/*---------------------------------------------------------------------------*/
_ti92plus: Int          // needed to produce ti92plus code
_ti89: Int              // needed to produce ti89 code
TI89: extern Bool
GRAY_OFF, GRAY_ON: extern IntLCD_SIZE: extern SizeTGrayMode: extern func (Int) -> BoolGetPlane: extern func (Int) -> UChar*ClrScr: extern funcDisplayOn: extern funcDrawStr: extern func (Short, Short, String, Int)A_NORMAL: extern Intngetchx: extern func

/*===========================================================================*/
/* main routine: where all the fun starts ...                                */
/*===========================================================================*/
_main: func {		DisplayOn()	ClrScr()	DrawStr(0, 0, "Hi, ooc world!", A_NORMAL)
                
    //-----------------------------------------------
    // wait that the user presses a key ...
    //-----------------------------------------------
    ngetchx()
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
