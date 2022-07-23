switch(state_name){
	case "stateIdle":
		draw_sprite_ext(sBox, 0, x, y, image_xscale, image_yscale, 0, c_green, 1)
		break
	case "stateAgro":
		draw_sprite_ext(sBox, 0, x, y, image_xscale, image_yscale, 0, c_red, 1)
		break

}