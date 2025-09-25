function check_wall_colision(){
	if(place_meeting(x+xVel,y, obj_wall)){
		xVel=0
	}
	if(place_meeting(x,y+yVel, obj_wall)){
		yVel=0
	}

}


function check_water_colision(){
	if((place_meeting(x, y, obj_water))){
		return true;
	}
	return false;
}