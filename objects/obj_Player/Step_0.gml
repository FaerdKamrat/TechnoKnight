key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);

if(key_right || key_left || key_jump) controller = 0;

if(abs(gamepad_axis_value(0,gp_axislh)) > 0.2) {
	key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
	key_right = max(gamepad_axis_value(0, gp_axislh),0);
	controller = 1;
}
if(gamepad_button_check_pressed(0,gp_face1)) {
	key_jump = 1;
	controller = 1;
}

#region Acceleration
//accelering och inbromsning värden
var _grounded = place_meeting(x, y+1, obj_Solid);
var _gAccel = 0.1;
var _gDeccel = 0.2;

var _airAccel = 0.09;
var _airDeccel = 0.1;

//om man är på marken mattar in dem i enityAccel functionen.
if(_grounded){
	entityAccel(_gAccel, _gDeccel, maxHsp);
	if(key_jump) vsp = jumpForce;
	jumpAmount = 1;
}
else{
	vsp += grv;
	entityAccel(_airAccel, _airDeccel, maxHsp*0.5);
	if(key_jump && jumpAmount > 0){
		vsp = jumpForce*0.5;
		jumpAmount--;
	}
}
#endregion Acceleration


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


if(hsp > 0) image_xscale = 1;
else if(hsp < 0) image_xscale = -1;
//gör att spelares x och y pos föendras 
//med hjälp av hsp och vsp
y += vsp;
x += hsp;