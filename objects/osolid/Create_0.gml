on_right = instance_place(x+10, y, oSolid)
on_left = instance_place(x-10, y, oSolid)
if(on_right != noone) on_right = false
else on_right = true

if(on_left != noone) on_left = false
else on_left = false