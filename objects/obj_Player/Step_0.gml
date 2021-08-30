key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);

if(key_right || key_left || key_jump) controller = false;

if(abs(gamepad_axis_value(0,gp_axislh)) > 0.2) {
	key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
	key_right = max(gamepad_axis_value(0, gp_axislh),0);
	controller = true;
}
if(gamepad_button_check_pressed(0,gp_face1)) {
	key_jump = 1;
	controller = 1;
}
var _move = key_right-key_left;

if(_move != 0){
	hsp += _move*accel;
	hsp = clamp(hsp,-maxHsp,maxHsp);
} 
else{
	hsp = lerp(hsp, 0, 0.3);
}

if(place_meeting(x, y+1, obj_Solid)){
	alarm[0] = 10;
	jumpAmount = 1;
	if(alarm[0] != -1 && key_jump) vsp = jumpForce; 
}
else{
	if(alarm[0] != -1 && key_jump) vsp = jumpForce; 
	else if(alarm[0] == -1 && key_jump && jumpAmount > 0){
		vsp = jumpForce*0.6;
		jumpAmount--;
	}
	vsp += grv;
}


#region Collision
//pixel perfect Collision med obj_solid

if(place_meeting(x+hsp, y, obj_Solid)){
	while(!place_meeting(x+sign(hsp), y, obj_Solid)){
		x += sign(hsp);
	}
	hsp = 0;
}
if(place_meeting(x, y+vsp, obj_Solid)){
	while(!place_meeting(x, y+sign(vsp), obj_Solid)){
		y += sign(vsp);
	}
	vsp = 0;
}
#endregion Collision


//gör att spelares x och y pos föendras 
//med hjälp av hsp och vsp
y += vsp;
x += hsp;


if(hsp != 0) image_xscale = sign(hsp);

