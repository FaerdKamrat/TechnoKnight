right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
//accelering och inbromsning värden
#region Acceleration
var _grounded = place_meeting(x, y+1, obj_Solid);
var _gAccel = 0.1;
var _gDeccel = 0.12;

var _airAccel = 0.09;
var _airDeccel = 0.1;

//om man är på marken mattar in dem i enityAccel functionen.
if(_grounded){
	entityAccel(_gAccel, _gDeccel, maxHsp);
}
else{
	vsp += grv;
	entityAccel(_gAccel, _gDeccel, maxHsp/2);
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


//gör att spelares x och y pos föendras 
//med hjälp av hsp och vsp
y += vsp;
x += hsp;