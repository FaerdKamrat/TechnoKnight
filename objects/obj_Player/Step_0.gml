key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
key_jump_held = keyboard_check(vk_space) || gamepad_button_check(0,gp_face1)

if(key_right || key_left || key_jump || key_jump_held) controller = false;

if(abs(gamepad_axis_value(0,gp_axislh)) > 0.2) {
	key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
	key_right = max(gamepad_axis_value(0, gp_axislh),0);
	controller = true;
}
if(gamepad_button_check_pressed(0,gp_face1)) {
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
	accel = 1;
	if(alarm[0] != -1 && key_jump) vsp = jumpForce; 
}

else{
	if(alarm[0] != -1 && key_jump) vsp = jumpForce; 
	else if(alarm[0] == -1 && key_jump && jumpAmount > 0){
		vsp = jumpForce*0.7;
		jumpAmount--;
	}
	vsp += grv;
	accel = 0.4;
}
if(vsp < 0 && !key_jump_held) vsp = max(vsp,0);

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


//gör att spelares x och y pos föendras 
//med hjälp av hsp och vsp




if(hsp != 0) image_xscale = sign(hsp);

