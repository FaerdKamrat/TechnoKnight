_temp_dir = 1;
if(hsp != 0) {
	draw_sprite_ext(spr_PlayerIDLE, 0, x, y, walk_dir, 1, 0, c_green, 1);
	var _temp_dir = walk_dir;
}
else{
	if(walk_dir != 0)_temp_dir = walk_dir
	draw_sprite_ext(spr_PlayerIDLE, 0, x, y, _temp_dir, 1, 0, c_green, 1);
	
	}
	
	

show_debug_message(point_direction(x,y,obj_Player.x,obj_Player.y))