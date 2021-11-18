
if(obj_Player.x < x && is_agro) walk_dir = -1;
else if(obj_Player.x > x && is_agro) walk_dir = 1;
if(obj_Player.y == y && image_xscale == walk_dir){
	is_agro = true;
	
	hsp = max_spd*walk_dir
}
else{
	alarm[2] = random_range(60,60*2);
}

vsp += grv;

#region random Walk
var _random_walk = irandom(60);
if(_random_walk == 60 && !is_agro && alarm[0] == -1 && alarm[1] == -1){
	alarm[0] = random_range(60,120);
	walk_dir = choose(-1,1);
}
if(alarm[0] != -1 && alarm[1] == -1 && !is_agro) {
	hsp = walk_dir*spd;
}
#endregion random Walk

#region Collision
//pixel perfect Collision med obj_solid

if(place_meeting(x+hsp, y, obj_Solid)){
	while(!place_meeting(x+sign(hsp), y, obj_Solid)){
		x += sign(hsp);
	}
	hsp = 0;	
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
show_debug_message(string(walk_dir)+"   "+string(is_agro)+"   ")

if(hsp != 0) image_xscale = sign(walk_dir);

