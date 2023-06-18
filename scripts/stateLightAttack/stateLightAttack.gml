// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function stateLightAttack(){
	state_string = "stateLightAttack"
	
	mask_index = attack_mask
	var hit_list = ds_list_create()
	var hits = instance_place_list(x, y, obj_Enemy, hit_list, false)
	if(hits > 0) {
		for(var i = 0; i < hits; i++){
			var hit_id = hit_list[| i]
			hit_id.is_hit = true
		}
	}
	if(image_index == light_image_index) {
		light_attack_count += 1
		if(mask_index == spr_LightAttackComboTwoHB) light_attack_count = 0
	}

	ds_list_destroy(hit_list)
	mask_index = spr_player
}
	
 