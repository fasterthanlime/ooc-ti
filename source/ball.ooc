import tigcc
include all

/**
 * Ball class
 */
Ball: class {
	
	x, y, radius: Short
	
	init: func (=x, =y, =radius) {
		DrawClipEllipse(x, y, radius, radius, ScrRect, A_NORMAL)
	}
	
	move: func(.x, .y) {
		DrawClipEllipse(this x, this y, radius, radius, ScrRect, A_XOR)
		this x = x
		this y = y
		DrawClipEllipse(this x, this y, radius, radius, ScrRect, A_NORMAL)
	}
	
}

/**
 * main routine: where all the fun starts =D
 */
_main: func {
	
	DisplayOn()
	ClrScr()
	
	randomize()
	radius := 5
	x = radius, y = radius, velx = 0, vely = 0 : Short
	
	ball := Ball new(radius * 3, radius * 3, radius)
	
	for (i in 0..1000) {
		
		if(random(30) == 1) {
			velx = random(3) - 1
			vely = random(3) - 1
		}
		
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
			vely = -vely
			y = LCD_HEIGHT - radius
		}
		
		ball move(x, y)
		
		for(j in 1..2300) {}
		
	}

    ngetchx()
	
}
