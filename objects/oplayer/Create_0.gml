#region States
#region state: free

/*
	state free är state:n som är när man rör sig runt fritt. och det är den state:n 
	som man ändrar sin state till en annan state
*/
stateFree = function(){
	
#region movement
// denna är den som gör att man kan röra sig.
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
#endregion movement
// booleans och TS som går igång när man nuddar marken
	if(place_meeting(x, y+1, oSolid)){
		if(!ts_check_active(meleL_delay)) sword_swingble = true
		if(!ts_check_active(bow_shootble)) bow_shootble = true
		is_grounded = true
		dashble = true
		time_source_start(jump_delay)
	} else is_grounded = false
//hop metoden körs
	jump()
	
/*
under här så är så är det state ändringar ex dash.
*/

#region dash
// om man klickar på dash knappen så staten ändras och sen så kommer vecktorer att ändras.
	if(keyboard_check_pressed(key.dash) && dashble && !ts_check_active(dash_cooldown)) {
		state = "stateDash"
		time_source_start(dash_delay)
		time_source_start(dash_cooldown)
		dashble = false
		vector.x = 0
		vector.y = 0
		state = stateDash
		time_source_start(ghost)
		dash_count = 0
	}
#endregion dash

#region mele
//mus funkar inte på NortLap av någon anleding.

//ändrar olika states till mele och sen bestämer den vilken mele attack som det blir beroende på olika parametrar.
if(keyboard_check_pressed(ord("F")) && sword_swingble){
	if(ts_check_active(meleL2) && is_grounded){
		vector.y = 0
		vector.x *= 0.3
		state = stateLightAttackSecond 
	}
	else if(!ts_check_active(meleL2)){
		if(ts_check_active(jump_delay)){
			if(abs(vector.x) == 10) vector.x += 15*dir
			else if(abs(vector.x) <= 5) vector.x = 0
			else vector.x -= 5*dir
			state = stateLightAttackNormal
		} else if(!is_grounded){
			state = stateLightAttackAir
		}
	}
}
#endregion mele

if(keyboard_check_pressed(ord("G")) && bow_shootble){
	vector.y = 0
	vector.x *= 0.1
	state = stateProjectile
}
}



#region  jump

jump = function(){
	if(ts_check_active(jump_delay)){
		if(key_jump) {
			vector.y = -20
		}
		if(vector.y < 0 && !key_jump_hold) vector.y = max(vector.y, -4);
	}
}
jump_delay = time_source_create(time_source_game, 0.3, time_source_units_seconds, jump)

#endregion 
#endregion

#region state: dash

stateDash = function(){
	state_name = "stateDash"
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
	if(dash_count < 3)	time_source_start(ghost)
	dash_count += 1
	instance_create_layer(x,y, "Instances", oDashGhost, {
		image_xscale : oPlayer.image_xscale,
		image_yscale : oPlayer.image_yscale
	})
}

#region ts
dash_delay = time_source_create(time_source_game, 15, time_source_units_frames, dashStop)
ghost = time_source_create(time_source_game, 5, time_source_units_frames, dashGhost)
dash_cooldown = time_source_create(time_source_game, 2, time_source_units_seconds, function(){
	time_source_start(meleL2)
})
#endregion ts
#endregion state: dash 

#region state: mele attack 
stateLightAttackNormal = function(){
	state_name = "stateLightAttackNormal"
	if(!ts_check_active(meleL_delay)) time_source_start(meleL_delay)
	time_source_start(meleL2)
	mask_index = sBoxL1
	hitreg(state_name)
	mask_index = mask
	
	
}
stateLightAttackAir = function(){
	state_name = "stateLightAttackAir"
	time_source_stop(meleL2)
	sword_swingble = false
	if(!ts_check_active(meleL_delay)) time_source_start(meleL_delay)
	mask_index = sBoxLair
	hitreg(state_name)
	mask_index = mask
	vector.y -= 1
}
stateLightAttackSecond = function(){
	state_name = "stateLightAttackSecond"
	time_source_stop(meleL2)
	sword_swingble = false
	if(!ts_check_active(meleL_delay)) time_source_start(meleL_delay)
	mask_index = sBoxL2
	hitreg(state_name)
	mask_index = mask
	vector.y -= 0.1
}
#region ts
meleL2 = time_source_create(time_source_game, 1, time_source_units_seconds, function(){})
meleL_delay = time_source_create(time_source_game, 8, time_source_units_frames, function(){
	state = stateFree
}) 
#endregion ts
#endregion state: mele attack 

#region state: projectile
stateProjectile = function(){
	state_name = "stateProjectile"
	if(!ts_check_active(projectile_delay) && bow_shootble){
		time_source_start(projectile_delay)
		sword_swingble = false
		bow_shootble = false
		instance_create_layer(x, y, "Instances", oProjectile, {
			image_xscale : 0.5,
			image_yscale : 0.3,
			dir : dir
		})
	}
}

#region ts
projectile_delay = time_source_create(time_source_game, 1.5, time_source_units_seconds, function(){
	state = stateFree
	time_source_start(projectile_cooldown)
})
projectile_cooldown = time_source_create(time_source_game, 2, time_source_units_seconds, function(){})
#endregion ts
#endregion state: projectile

state = stateFree
#endregion States

#region Arrays

trase_list = []
#endregion Arrays

#region Time Sourcess
	trase = time_source_create(time_source_game, 60*5, time_source_units_frames, function(){time_source_start(trase_2)})
	trase_2 = time_source_create(time_source_game, 60*5, time_source_units_frames, function(){})
#endregion Time Sources