key_right = keyboard_check(ord(key.right))
key_left = keyboard_check(ord(key.left))
key_jump_hold = keyboard_check(key.jump)
key_jump = keyboard_check_pressed(key.jump)

if(keyboard_check_pressed(vk_escape)){
	time_source_start(trase)
	trase_list = []
}

if(ts_check_active(trase)){
	array_push(trase_list, [x, y, state_name, round(time_source_get_time_remaining(trase))])
}
state()

print(dir)
#region Col

if(place_meeting(x + vector.x, y, oSolid)){
	if(state == stateDash) state = dashStop
	while(!place_meeting(x + sign(vector.x), y, oSolid)){
		x += sign(vector.x)
	}
	vector.x = 0
}
x += vector.x

if(place_meeting(x, y + vector.y, oSolid)){
	while(!place_meeting(x, y + sign(vector.y), oSolid)){
		y += sign(vector.y)
	}
	vector.y = 0
}
y += vector.y

#endregion Col

