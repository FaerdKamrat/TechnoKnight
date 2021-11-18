if(is_agro){
	spd = max_spd;
	if(obj_Player.x < x) walk_dir = -1;
	if(obj_Player.x > x) walk_dir = 1;
}
else{
	var _random_walk = irandom(96);
	if(_random_walk == 60 && alarm[1] == -1 && alarm[0] == -1){
		spd = wonder_spd;
		alarm[0] = irandom_range(30,60);
		walk_dir = choose(-1,1);
	}
}

if(obj_Player.y < y && distance_to_object(obj_Player) <= (32*5)){
	is_agro = true;
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

if(hsp != 0) image_xscale = walk_dir;

