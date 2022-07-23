stateIdle = function(){
	state_name = "stateIdle"
	if(!ts_check_active(jump_delay)) time_source_start(jump_delay)
	if(place_meeting(x, y+1, oSolid) && !ts_check_active(jump_dir_delay)) { vector.x = 0 }
	if(jumping_dir == player_dir && LookForPlayerHnV(true, x, 64*6) && !LookForPlayerHnV(false, y, 20) && playerInSight()) state = stateAgro
}
stateAgro = function(){
	state_name = "stateAgro"
	
	//if(!distance_to_object(oPlayer) < 64*5 || LookForPlayerHnV(false, y, 20) || !playerInSight()){
	//	state = stateIdle
	//}
	if(place_meeting(x, y+1, oSolid) && !ts_check_active(jump_dir_delay)) { vector.x = 0 }
	if(!ts_check_active(jump_delay) && grounded){
		time_source_reconfigure(jump_delay, 60*1.5, time_source_units_frames, stateJump)
		time_source_start(jump_delay)
	}
	
		
		
	
	
}


stateJump = function() {
	ground_instance = instance_place(x, y+1, oSolid)
	if(state_name == "stateIdle"){
			
		if(ground_instance != noone && !ts_check_active(jump_dir_delay)){
			time_source_start(jump_dir_delay)
			if(ground_instance.on_left || ground_instance.on_right || place_meeting(x + 96*jumping_dir, y, oSolid)){
				jumping_dir = -jumping_dir
			}
		} 
		vector.y = -8
		vector.x = 3 * jumping_dir
	}
	else if(state_name == "stateAgro"){
		if(!ts_check_active(jump_dir_delay)) time_source_start(jump_dir_delay)
		vector.y = -8
		vector.x = 5 * player_dir
	}
}
jump_dir_delay = time_source_create(time_source_game, 0.5, time_source_units_seconds, function(){})
jump_delay = time_source_create(time_source_game, 60*2, time_source_units_frames, stateJump)
		
state = stateIdle