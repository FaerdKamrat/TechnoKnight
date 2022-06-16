#region state free
stateFree = function(){
	var move_h = key_right - key_left;

	if(move_h != 0){
		dir = move_h
		
		
		vector.x += move_h * 0.4
		if(move_h != sign(vector.x))	vector.x += move_h * 0.4

		vector.x = clamp(vector.x, -10, 10)
	} else vector.x = lerp(vector.x, 0, 0.4)
	vector.y += 0.5
	if(place_meeting(x, y+1, oSolid)){
		time_source_start(jump_delay)
	}
	jump()
	if(keyboard_check_pressed(key.dash)) {
		time_source_start(dash_delay)
		vector.x = 0
		vector.y = 0
		state = stateDash
		 var ghost = time_source_create(time_source_game, 5, time_source_units_frames, dashGhost)
		 time_source_start(ghost)
		dash_count = 0
	}
}
#endregion

#region  jump
jump = function(){
	if(time_source_get_state(jump_delay) == time_source_state_active){
		if(key_jump) {
			vector.y = -12
		}
		if(vector.y < 0 && !key_jump_hold) vector.y = max(vector.y, -4);
	}
}
#endregion 

#region state dash
stateDash = function(){
	color = c_red
	
	vector.x += dir * 15
	vector.x = clamp(vector.x, -35, 35)
	
			
	
		
}

dashStop = function(){
	color = c_white
	state = stateFree
	vector.x -= sign(vector.x) - 15 
}

dashGhost = function(){
	 var ghost = time_source_create(time_source_game, 5, time_source_units_frames, dashGhost)
	if(dash_count < 3)	time_source_start(ghost)
	dash_count += 1
	instance_create_layer(x,y, "Instances", oDashGhost, {
		image_xscale : oPlayer.image_xscale,
		image_yscale : oPlayer.image_yscale
	})
}
#endregion 


state = stateFree
dash_delay = time_source_create(time_source_game, 15, time_source_units_frames, dashStop)
jump_delay = time_source_create(time_source_game, 0.3, time_source_units_seconds, jump)