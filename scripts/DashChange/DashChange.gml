// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DashChange(){
	if(keyboard_check_pressed(vk_shift)){
			state = stateDash
		
			with(instance_create_layer(0, 0, "alarm", obj_alarm)) {
				callback_object = other
				var func = function() {
					callback_object.state = stateFree
				}
				alarm_init(30, func)
			}
			vect.y = 0;
		}
}