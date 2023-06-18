/*
	En simpel Class som kör funktionen callback efter ett alarm har gått ut,
	detta init med funktionen där man definierar callback funktionen och tiden 
	som alarmet ska köra i.
	
	+ debug ritar text om man vill på X och Y 
*/
callback = ""
debug_name = ""
X = 0
Y = 0
function alarm_init(_alarm_timer, _callback, _debug_name = "", _X = 0, _Y = 0){
	callback	= _callback
	alarm[0]	= _alarm_timer
	debug_name	= _debug_name
	X			= _X
	Y			= _Y
}