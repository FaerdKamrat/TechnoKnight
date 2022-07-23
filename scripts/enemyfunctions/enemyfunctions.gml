// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerInSight(){
	return (collision_line(x, y, oPlayer.x, oPlayer.y, oPlayer, false, false) && 
			!collision_line(x, y, oPlayer.x, oPlayer.y, oSolid, false, false))
}
function LookForPlayerHnV(true_x_false_y, pos, delta){
	if(true_x_false_y){
		return (oPlayer.x <= pos + delta && oPlayer.x >=  pos - delta)	
	} else{
		return (oPlayer.y <= pos + delta && oPlayer.y >= pos - delta)
	}
}