
vector.x += dir * 0.7
vector.x = clamp(vector.x, -30, 30)

if(distance_to_point(og_pos.x, og_pos.y) >= 800){
	instance_destroy(self)
}

if(place_meeting(x, y, oSolid)){
	instance_destroy(self)
}
var inst = instance_place(x, y, oTargetDummy)
if(inst != noone){
	inst.isHit()
	instance_destroy(self)
}

x += vector.x