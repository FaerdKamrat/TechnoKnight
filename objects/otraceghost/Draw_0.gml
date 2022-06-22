if(ts_check_active(trace_2)){
	for(var i = 0; i < array_length(trace_list); i++){
		var c1 = c_red
			switch(trace_list[i][2]){
				case "stateFree":
					c1 = c_green
					break
				case "stateDash":
					c1 = c_red
					break
				case "stateLightAttackNormal":
					c1 = c_yellow
					break
				case "stateLightAttackSecond":
					c1 = c_orange
					break
				case "stateLightAttackAir":
					c1 = c_lime
					break
		}
		
		if(i != 0){
			draw_line_color(
				trace_list[i-1][0],
				trace_list[i-1][1],
				trace_list[i][0],
				trace_list[i][1],
				c1,
				c1
			)			
		}
	}
}