include ./flags

include all

/*---------------------------------------------------------------------------*/
/* global variables                                                          */
/*---------------------------------------------------------------------------*/
_ti92plus: Int          // needed to produce ti92plus code
_ti89: Int              // needed to produce ti89 code

TI89: extern Bool
GRAY_OFF, GRAY_ON: extern Int
LCD_SIZE: extern SizeT
GrayMode: extern func (Int) -> Bool
GetPlane: extern func (Int) -> UChar*

/** graph functions */
ClrScr: extern func
DisplayOn: extern func
DrawStr: extern func (Short, Short, String, Int)
DrawClipEllipse: extern func (Short, Short, Short, Short, SCR_RECT*, Short)

A_NORMAL, A_XOR, SPRT_AND, SPRT_OR, SPRT_XOR: extern Int

Sprite8: extern func (Short, Short, Short, Pointer, Pointer, Int)
Sprite16: extern func (Short, Short, Short, Pointer, Pointer, Int)
Sprite32: extern func (Short, Short, Short, Pointer, Pointer, Int)

SCR_RECT: extern cover
ScrRect: extern SCR_RECT

ngetchx: extern func -> Short

LCD_WIDTH, LCD_HEIGHT: extern Int
LCD_MEM: extern Pointer

random: extern func (Int) -> Int
randomize: extern func -> Int

/* keyboard handling functions */
//_keytest: extern func (Short, Short) -> Short
_keytest: extern func (...) -> Short
kbhit: extern func -> Bool
OSInitKeyInitDelay: extern func (delay: Short) -> Short
OSInitBetweenKeyDelay: extern func (delay: Short) -> Short

KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT, RR_ESC: extern Short
