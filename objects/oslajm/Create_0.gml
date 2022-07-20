
stateIdle = function(){
	var move_h = 0
	var multi = 0
	if(move_target > x) multi = 1
	else if(move_target < x) multi = -1
	
	if(idle_walk){
		if(x == move_target) idle_walk = false
		else x+= multi
	} else {
		var random_walk = irandom(100)
		move_target = irandom_range(idle_walk_min, idle_walk_min+128)
		if(random_walk == 0) {
			idle_walk = true
		}
	}
	if(dist < 64*2){
		state = stateAgro
	}
	else if(player_dir == move_h && dist > 60*4){
		state = stateAgro	
	}
}

stateAgro = function(){
	
	//if(LookForPlayerHnV(false, 128) && playerInSight()){
		if(!ts_check_active(jump_delay) && grounded) time_source_start(jump_delay)
		
		if(vector.y != 0){
			vector.x += 0.3 * jumping_dir
		}
		else vector.x = lerp(vector.x, 0, 0.3)
		vector.x = clamp(vector.x, -10, 10)
		
	//} else state = stateIdle
	
}
jump_delay = time_source_create(time_source_game, 60*2, time_source_units_frames, function(){
		vector.y = -3
		jumping_dir = player_dir
	})
state = stateIdle