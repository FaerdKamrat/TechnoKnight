distans_player = distance_to_object(obj_Player)
if(is_agro){
	spd = lerp(spd, max_spd, 0.08);
	if(obj_Player.x < x) walk_dir = -1;
	if(obj_Player.x > x) walk_dir = 1;
}
else{
	var _random_walk = irandom(96);
	spd = lerp(spd, 0, 0.1);
	if(_random_walk == 60 && alarm[1] == -1 && alarm[0] == -1){
		spd = lerp(spd, wonder_spd, 0.8);
		alarm[0] = irandom_range(30,60);
		walk_dir = choose(-1,1);
	}
}

if((y < obj_Player.y+10 && y > obj_Player.y-10 && !is_attacking && distans_player <= (32*13)) || alarm[3] != -1){
	if(collision_line(x,y,obj_Player.x,obj_Player.y,obj_Player, false, false) 
	   && !collision_line(x,y,obj_Player.x,obj_Player.y,obj_Solid,false,false)) {
		if(alarm[4] == -1) alarm[3] = 5;
		var _PlayerPoint = point_direction(x,y,obj_Player.x,obj_Player.y);
		if(_PlayerPoint < 90 && walk_dir == 1 || _PlayerPoint > 90 && walk_dir == -1){
			is_agro = true;
		}
		else if( distans_player <= (32*2)) is_agro = true;
		
	}
}
else is_agro = false;
	





vsp += grv;

hsp = spd*walk_dir	

#region Collision
//pixel perfect Collision med obj_solid

if(place_meeting(x+hsp, y, obj_Solid)){
	while(!place_meeting(x+sign(hsp), y, obj_Solid)){
		x += sign(hsp);
	}
	hsp = 0;	
	is_agro = false;
}

x += hsp;
if(place_meeting(x, y+vsp, obj_Solid)){
	while(!place_meeting(x, y+sign(vsp), obj_Solid)){
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;
#endregion Collision
show_debug_message(string(is_agro)+"    "+string(distance_to_object((obj_Player)))+"    "+string(obj_Player.y)+"   "+string(y))



