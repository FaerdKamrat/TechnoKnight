#region controlls
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
key_jump_held = keyboard_check(vk_space) || gamepad_button_check(0,gp_face1);
key_dash = keyboard_check_pressed(vk_shift) || gamepad_button_check_pressed(0,gp_face2);

if(key_right || key_left || key_jump || key_jump_held) controller = false;
if(gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_face2)) controller = true;

if(abs(gamepad_axis_value(0,gp_axislh)) > 0.2) {
	key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
	key_right = max(gamepad_axis_value(0, gp_axislh),0);
	controller = true;
}
#endregion controlls


#region movment
dashDuration--;
var _move = key_right-key_left;

if(_move != 0 && dashDuration <= 0){
	hsp += _move*accel;
	hsp = clamp(hsp,-maxHsp,maxHsp);
} 
else if (_move == 0 && dashDuration <= 0){
	hsp = lerp(hsp, 0, 0.3);
}

if(key_dash && dashDuration <= -10){
	dashDuration = 20;
	hsp = image_xscale*5;
	
}
if(dashDuration > 0){
	hsp += image_xscale*1.1;
	
	hsp = clamp(hsp, -dashsp, dashsp);
	switch(dashDuration){
		case 6:
			instance_create_layer(x, y, "Instances", obj_DashGhost);
			break;
		case 12:
			instance_create_layer(x, y, "Instances", obj_DashGhost);
			break;
		case 18:
			instance_create_layer(x, y, "Instances", obj_DashGhost);
			break;
	}
	show_debug_message(string(hsp));
}

if(place_meeting(x, y+1, obj_Solid)){
	alarm[0] = 10;
	jumpAmount = 1;
	accel = 1;
	if(alarm[0] != -1 && key_jump) vsp = jumpForce; 
}

else {
	if(alarm[0] != -1 && key_jump) vsp = jumpForce; 
	else if(alarm[0] == -1 && key_jump && jumpAmount > 0){
		vsp = jumpForce*0.7;
		jumpAmount--; 
	}
	vsp += grv;
	accel = 0.4;
}
if(dashDuration > 0) vsp = 0;
if(vsp < 0 && !key_jump_held) vsp = max(vsp,0);
#endregion movment


#region Collision
//pixel perfect Collision med obj_solid

if(place_meeting(x+hsp, y, obj_Solid)){
	while(!place_meeting(x+sign(hsp), y, obj_Solid)){
		x += sign(hsp);
	}
	hsp = 0;
	dashDuration = 0;
	alarm[2] = 5;
	if(alarm[2] == -1)vsp = 3;
	
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


if(hsp != 0) image_xscale = sign(hsp);