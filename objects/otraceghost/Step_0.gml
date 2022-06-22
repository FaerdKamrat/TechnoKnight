if(keyboard_check_pressed(vk_escape)){
	time_source_start(trace)
	trace_list = []
}
if(ts_check_active(trace)){
	array_push(trace_list, [inst.x, inst.y, inst.state_name, time_source_get_time_remaining(trace)])
}