// stopar spelaren om man nuddar en väg :O
function wall_collision(object){
	var collision = {
		x : instance_place(x + vect.x, y, object),
		y : instance_place(x, y + vect.y, object)
	}

	if(collision.x != noone){
		while(!place_meeting(x + sign(vect.x), y, object)){
			x += sign(vect.x)
		}
		if(state_string == "stateDash"){
			state = stateFree
		}
		vect.x = 0
	}
	if(collision.y != noone){
		while(!place_meeting(x, y + sign(vect.y), object)){
			y += sign(vect.y)
		}
		vect.y = 0
	}
}