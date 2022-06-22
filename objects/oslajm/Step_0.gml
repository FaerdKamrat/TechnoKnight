dist = distance_to_object(oPlayer);
player_dir = 0;
if(oPlayer.x > x) player_dir = 1
else if(oPlayer.x < x) player_dir = -1

state()


if(place_meeting(x + vector.x, y, oSolid)){
	while(!place_meeting(x + sign(vector.x), y, oSolid)){
		x += sign(vector.x)
	}
	vector.x = 0
}
x += vector.x
if(place_meeting(x, y + vector.y, oSolid)){
	while(!place_meeting(x, y + sign(vector.y), oSolid)){
		y += sign(vector.y)
	}
	vector.y = 0
}
y += vector.y

