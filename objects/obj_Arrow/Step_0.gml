hsp += image_xscale*accel;
hsp = clamp(hsp,-maxHsp,maxHsp);

if(x >= obj_Player.x+480) instance_destroy();
if(x <= obj_Player.x-480) instance_destroy();


x+=hsp