is_hit = false
delay = time_source_create(time_source_game, 3, time_source_units_frames, function(){is_hit = false})

function isHit(attack){
	is_hit = true
	time_source_start(delay)
}