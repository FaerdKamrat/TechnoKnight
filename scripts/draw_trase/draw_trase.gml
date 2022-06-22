
function draw_trase(postion_list, ts_timer, c1, c2){
	for(var i = 0; i < array_length(postion_list); i++){
		if(i != 0){
			draw_line_color(
				postion_list[i-1][0],
				postion_list[i-1][1],
				postion_list[i][0],
				postion_list[i][1],
				c1,
				c2
			)			
		}
	}
}