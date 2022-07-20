draw_sprite_ext(sprite_index,0, x, y, image_xscale, image_yscale, 0, color, 1)
switch(state){
	case stateLightAttackNormal:
		draw_sprite_ext(sBoxL1,0, x, y, image_xscale, image_yscale, 0, c_white , 1)
		break
	case stateLightAttackCombo:
		draw_sprite_ext(sBoxL2,0, x, y, image_xscale, 1, 0, c_white , 1)
		break
	case stateLightAttackAir:
		draw_sprite_ext(sBoxLair,0, x, y, image_xscale, 1, 0, c_white , 1)
		break
	case stateHeavyCombo:
		draw_sprite_ext(sBoxH2,0, x, y, image_xscale, 1, 0, c_white , 1)
		break
	case stateHeavyAir:
		if(place_meeting(x, y + 1, oSolid))draw_sprite_ext(sBoxH2,0, x, y, image_xscale, 1, 0, c_white , 1)
		break
	case stateHeavyNormal:
		draw_sprite_ext(sBoxH1,0, x, y, image_xscale, 1, 0, c_white , 1)
		break
}
draw_set_halign(fa_center)
draw_text(x,y-128, state_name)
draw_text(x,y-196, string(light_attack_count))
draw_text(x,y-256, string(heavy_attack_count))
draw_text(x,y-280, string(is_grounded))
