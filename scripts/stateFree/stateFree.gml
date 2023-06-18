/*
	stateFree är staten som är när man är fri att röra sig. det är också de 
	staten som är root staten. det är från stateFree man tar sig det majoriteten
	av andra states.
*/
function stateFree(){
	state_string = "stateFree"
	current_dir = key_right - key_left
	dir = current_dir
	if(current_dir == 0) {
		vect.x = lerp(vect.x, 0, 0.25)
	} else {
		image_xscale = dir
		vect.x += 0.1 * current_dir
		vect.x = clamp(vect.x, -max_spd, max_spd)
	}
	if(place_meeting(x, y + 1, obj_Solid)){
		if(key_jump){
			vect.y = jump_spd
		}
	} else vect.y += 0.25
	if(vect.y < 0 && !key_jump_hold) vect.y = max(jump_spd/4,0)
	
	DashChange()
	
	LightAttackChange()
}