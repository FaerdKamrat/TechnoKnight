function LightAttackChange(){
	if(array_length(light_attack_alarm_list) > 0) {
		for(var i = 0; i < array_length(light_attack_alarm_list); i++) {
			instance_destroy(light_attack_alarm_list[i])
			array_delete(light_attack_alarm_list, i, 0)
		}
	}
	
	if(mouse_check_button_pressed(mb_left)){
		if(light_attack_count == 0) {
			if(array_length(light_attack_alarm_list) > 0) {
				for(var i = 0; i < array_length(light_attack_alarm_list); i++) {
					array_delete(light_attack_alarm_list, i, 0)
				}
			}
			vect.x = sign(vect.x) * 0.5
			vect.y = -1
			light_image_index = 2
			state = stateLightAttack
			attack_mask = spr_LightAttackHB
			sprite_index = spr_LightAttack
			var current_alarm = instance_create_layer(0, 0, "alarm", obj_alarm)
			array_push(light_attack_alarm_list, current_alarm)
			with(current_alarm) {
				callback_object = other
				var func = function() {
					if(callback_object.state_string == "stateFree") callback_object.light_attack_count = 0
				}
				alarm_init(60, func)
			}
		}
		else if(light_attack_count == 1) {
			
			vect.x = sign(vect.x) * 0.3
			vect.y = 0.3
			
			light_image_index = 2
			state = stateLightAttack
			attack_mask = spr_LightAttackComboOneHB
			sprite_index = spr_LightAttackComboOne
			var current_alarm = instance_create_layer(0, 0, "alarm", obj_alarm)
			array_push(light_attack_alarm_list, current_alarm)
			with(current_alarm) {
				callback_object = other
				var func = function() {
					if(callback_object.state_string == "stateFree") callback_object.light_attack_count = 0

				}
				alarm_init(60, func)
			}
		}
		else {
			vect.x = sign(vect.x) * 2
			vect.y = 0
			
			light_image_index = 3
			state = stateLightAttack
			attack_mask = spr_LightAttackComboTwoHB
			sprite_index = spr_LightAttackComboTwo
			light_attack_count = 0
		}
	}
}