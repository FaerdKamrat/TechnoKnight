draw_sprite_ext(sprite_index,0, x, y, image_xscale, image_yscale, 0, color, 1)
switch(state){
	case stateLightAttackNormal:
		draw_sprite_ext(sBoxL1,0, x, y, image_xscale, image_yscale, 0, c_yellow, 1)
		break
	case stateLightAttackSecond:
		draw_sprite_ext(sBoxL2,0, x, y, image_xscale, 1, 0, c_red, 1)
		break
	case stateLightAttackAir:
		draw_sprite_ext(sBoxLair,0, x, y, image_xscale, 1, 0, c_red, 1)
		break
}
draw_set_halign(fa_center)
draw_text(x,y-128, state_name)

if(array_length(trase_list) > 0 && ts_check_active(trase_2)){
	draw_trase(trase_list, time_source_get_time_remaining(trase_2), c_white, c_red)
}

