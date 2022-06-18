// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hitreg(attack){
	var inst_list = ds_list_create()

	var index = instance_place_list(x, y, oTargetDummy, inst_list, false);

	if(index > 0)
	{
	    for (var i = 0; i < index; ++i;)
	    {
	        inst_list[| i].isHit(attack)
	       
	    }
	}
	ds_list_destroy(inst_list)
	 
}