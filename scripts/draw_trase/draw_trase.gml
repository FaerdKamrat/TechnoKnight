
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
			if(round(ts_timer) == round(postion_list[i][3])){
				if(postion_list[i][2] == "stateDash"){
					draw_sprite_ext(sBox, 0, postion_list[i][0], postion_list[i][1], 1, 2, 0, c_red, 1)
				} else{
					draw_sprite_ext(sBox, 0, postion_list[i][0], postion_list[i][1], 1, 2, 0, c_white, 1)
				}
				switch(postion_list[i][2]){
					case "stateLightAttackNormal":
						draw_sprite(sBoxL1, 0, postion_list[i][0], postion_list[i][1])
						break
					case "stateLightAttackAir":
						draw_sprite(sBoxLair, 0, postion_list[i][0], postion_list[i][1])
						break
					case "stateLightAttackSecond":
						draw_sprite(sBoxL2, 0, postion_list[i][0], postion_list[i][1])
						break
				}
			}
		}
	}
}