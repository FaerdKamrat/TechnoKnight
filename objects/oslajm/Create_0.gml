
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
		//state = stateAgro
	}
	else if(player_dir == move_h && dist > 60*4){
		//stateAgro	
	}
}

state = stateIdle