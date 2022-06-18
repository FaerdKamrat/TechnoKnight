if(!is_hit) draw_sprite_ext(sBox,0, x, y, image_xscale, image_yscale, 0, c_grey, 1)


else{
	gpu_set_fog(true, c_red, 0, 0);
	draw_sprite_ext(sBox,0, x, y, image_xscale, image_yscale, 0, c_grey, 1)
	gpu_set_fog(false, c_red, 0, 0);
}