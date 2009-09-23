import tigcc
include all

ballSprite : UChar[] = [
	0b00111100,
	0b01111110,
	0b11111111,
	0b11111111,
	0b11111111,
	0b11111111,
	0b01111110,
	0b00111100,
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
	x = radius * 3, y = radius * 3, velx = 0.2, vely = 1 : Float
	
	ball := SpriteBall new(x, y, radius)
	
	accy := 0.5
	
	for (i in 0..1500) {
		
		vely += accy
		
		x += velx
		y += vely
		
		if(x < radius) {
			velx = -velx
			x = radius
		}
		
		if(x > LCD_WIDTH - radius) {
			velx = -velx
			x = LCD_WIDTH - radius
		}
		
		if(y < radius) {
			vely = -vely
			y = radius
		}
		
		if(y > LCD_HEIGHT - radius) {
			vely = -vely * 0.9
			y = LCD_HEIGHT - radius
		}
		
		ball move(x, y)
		
		if(vely abs() < 0.01) break;
		
		for(j in 1..2300) {}
		
	}

    ngetchx()
	
}
