dist = distance_to_object(oPlayer);
player_dir = 0;
if(oPlayer.x > x) player_dir = 1
else if(oPlayer.x < x) player_dir = -1


if(place_meeting(x, y+1, oSolid)){
	grounded = true
} else{
	grounded = false
	vector.y += 0.5
}
state()


if(place_meeting(x + vector.x, y, oSolid)){
	while(!place_meeting(x + sign(vector.x), y, oSolid)){
		x += sign(vector.x)
	}
	vector.x = 0
	jumping_dir = -jumping_dir
}
x += vector.x
if(place_meeting(x, y + vector.y, oSolid)){
	while(!place_meeting(x, y + sign(vector.y), oSolid)){
		y += sign(vector.y)
	}
	vector.y = 0
}
y += vector.y

