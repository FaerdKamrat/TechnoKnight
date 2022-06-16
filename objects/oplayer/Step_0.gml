key_right = keyboard_check(ord(key.right))
key_left = keyboard_check(ord(key.left))
key_jump_hold = keyboard_check(key.jump)
key_jump = keyboard_check_pressed(key.jump)

state()


#region Col
if(place_meeting(x + vector.x, y, oSolid)){
	if(state == stateDash) state = dashStop
	while(!place_meeting(x + sign(vector.x), y, oSolid)){
		x += sign(vector.x)
	}
	vector.x = 0
	
}

if(place_meeting(x, y + vector.y, oSolid)){
	while(!place_meeting(x, y + sign(vector.y), oSolid)){
		y += sign(vector.y)
	}
	vector.y = 0
}
#endregion Col


x += vector.x
y += vector.y