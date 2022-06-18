// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ts_check_active(time_source_id){
	return (time_source_get_state(time_source_id) == time_source_state_active)
}