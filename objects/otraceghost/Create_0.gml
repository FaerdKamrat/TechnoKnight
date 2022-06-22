trace_list = []

trace = time_source_create(time_source_game, frame_amount, time_source_units_frames, function(){time_source_start(trace_2)})
trace_2 = time_source_create(time_source_game, frame_amount, time_source_units_frames, function(){})