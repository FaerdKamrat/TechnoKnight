#region States
#region state: free
stateFree = function(){
	state_name = "stateFree"
	var move_h = key_right - key_left;

	if(move_h != 0){
		dir = move_h
		image_xscale = dir
		
		vector.x += move_h * 0.4
		if(move_h != sign(vector.x))	vector.x += move_h * 0.4

		vector.x = clamp(vector.x, -10, 10)
	} else vector.x = lerp(vector.x, 0, 0.4)
	vector.y += 0.5
	
	if(place_meeting(x, y+1, oSolid)){
		if(!ts_check_active(meleL2) && sword_swingble == false) sword_swingble = true
		is_grounded = true
		dashble = true
		time_source_start(jump_delay)
	} else is_grounded = false
	
	jump()
	if(keyboard_check_pressed(key.dash) && dashble && time_source_get_state(dash_cooldown) != time_source_state_active) {
		time_source_start(dash_delay)
		time_source_start(dash_cooldown)
		dashble = false
		vector.x = 0
		vector.y = 0
		state = stateDash
		var ghost = time_source_create(time_source_game, 5, time_source_units_frames, dashGhost)
		time_source_start(ghost)
		dash_count = 0
	}
	
	if(mouse_check_button_pressed(mb_left) && sword_swingble){
		
		if(ts_check_active(meleL2)){
			vector.y = 0
			state = stateLightAttackSecond 
			sword_swingble = false
		}
		else{
			if(abs(vector.x) == 10) vector.x += 15*dir
			else if(abs(vector.x) <= 5) vector.x = 0
			else vector.x -= 5*dir
			state = stateLightAttackNormal
		}
	}
}


#region  jump
jump = function(){
	if(time_source_get_state(jump_delay) == time_source_state_active){
		if(key_jump) {
			vector.y = -20
		}
		if(vector.y < 0 && !key_jump_hold) vector.y = max(vector.y, -4);
	}
}
#endregion 
#endregion

#region state: dash
stateDash = function(){
	state_name = "stateLightAttack"
	color = c_red
	
	vector.x += dir * 15
	vector.x = clamp(vector.x, -35, 35)
	
			
	
		
}

dashStop = function(){
	color = c_white
	state = stateFree
	vector.x += dir * 15 
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
#endregion state: dash 

#region state: mele attack 
stateLightAttackNormal = function(){
	state_name = "stateLightAttackNormal"
	if(!ts_check_active(meleL_delay)) time_source_start(meleL_delay)
	time_source_start(meleL2)
	mask_index = sBox3
	hitreg(state_name)
	mask_index = mask
	
	
}
stateLightAttackSecond = function(){
	state_name = "stateLightAttackSecond"
	if(!ts_check_active(meleL_delay)) time_source_start(meleL_delay)
	mask_index = sBox34
	hitreg(state_name)
	mask_index = mask
	vector.y -= 0.5
	
}

#endregion state: mele attack 


state = stateFree
#endregion States

#region Time Sourcess
	dash_delay = time_source_create(time_source_game, 15, time_source_units_frames, dashStop) 
	jump_delay = time_source_create(time_source_game, 0.3, time_source_units_seconds, jump)
	dash_cooldown = time_source_create(time_source_game, 2, time_source_units_seconds, function(){})
	meleL2 = time_source_create(time_source_game, 2, time_source_units_seconds, function(){})
	meleL_delay = time_source_create(time_source_game, 8, time_source_units_frames, function(){
		state = stateFree
	}) 
	

#endregion Time Sources