/*
	dem här scriptsen kommer göra att movement kommer att
	känns smooth.  accerlation och inbromsning. 
*/
function entityAccel(){
	///@param accel
	///@param decel
	///@param maxHsp
	
	// deklarera några locala variabler
	var _keyPressed = right-left;
	var _accel = argument[0];
	var _deccel = argument[1];
	var _userMaxHsp = argument[2];
	
	//här andväder jag funktionen playerKeys som retunerar 
	//om player klickar på EN knapp
	if(playerKeys()) {
		hsp = lerp(hsp, _userMaxHsp*_keyPressed, _accel);
	}
	else {
		hsp = lerp(hsp, 0, _deccel);
	}
}

/*
	retunerar ett värde false om spelaren klickar in vänster och höger.
	eller inte klickar alls. kommer bara retunera ett true om spelare 
	klickar in en knapp.
*/
function playerKeys(){
	if(right && left || !right && !left) return false;
	return true;
}