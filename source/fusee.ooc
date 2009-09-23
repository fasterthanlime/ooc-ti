import tigcc
include all

ballSprite : UChar[] = [
	0b00011000,
	0b00111100,
	0b00111100,
	0b00111100,
	0b01111110,
	0b01111110,
	0b11100111,
	0b11100111,
	0b10000001,
]

ballSpriteHeight := sizeof(ballSprite)

/**
 * Ball class
 */
SpriteBall: class {
	
	x, y, radius: Short
	
	init: func (=x, =y, =radius) {
		draw()
	}
	
	move: func(.x, .y) {
		draw()
		this x = x
		this y = y
		draw()
	}
	
	draw: func {
		Sprite8 (x, y, ballSpriteHeight, ballSprite, LCD_MEM, SPRT_XOR)
	}
	
}

/**
 * main routine: where all the fun starts =D
 */
_main: func {
	
	DisplayOn()
	ClrScr()
	
	randomize()
	radius := 5.0
	x = radius * 3, y = LCD_HEIGHT, velx = 0.2, vely = 0 : Float
	
	ball := SpriteBall new(x, y, radius)
	
	accy := 0.1
	
	OSInitBetweenKeyDelay(5)
	OSInitKeyInitDelay(15)
	
	running := true
	
	while (running) {
		
		vely += accy
		velx *= 0.9
		
		x += velx
		y += vely
		
		if(x < 0) {
			velx = -velx
			x = radius
		}
		
		if(x > LCD_WIDTH - radius * 2) {
			velx = -velx
			x = LCD_WIDTH - radius * 2
		}
		
		if(y < 0) {
			vely = -vely * 0.5
			y = 0
		}
		
		if(y > LCD_HEIGHT - radius * 2) {
			vely = -vely * 0.5
			y = LCD_HEIGHT - radius * 2
		}
		
		ball move(x, y)
	
		while (kbhit()) {
			code := ngetchx()
			if(code == KEY_UP) {
				vely -= 0.15
			}if(code == KEY_DOWN) {
				vely += 0.15
			} else if(code == KEY_LEFT) {
				velx = -0.6
			} else if(code == KEY_RIGHT) {
				velx = 0.6
			} else {
				if(_keytest(RR_ESC)) {
					running = false
				}
			}
		}
		
		for(j in 1..2300) {}
		
	}
	
}
