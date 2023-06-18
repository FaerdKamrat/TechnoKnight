var color = c_white
if(alarm[0] != -1){
	color = c_red
}
draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		image_xscale,
		image_yscale,
		image_angle,
		color,
		image_alpha
	)