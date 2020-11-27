upObj.x = x + 15;
downObj.x = x +15;
upObj.y = y + 15;
downObj.y = y+15;

var objDir = point_direction(x+15,y+15,mouse_x,mouse_y);
direction = objDir;
downObj.image_speed = 15;



	//22.5
	if(direction < 22.5 || direction > 337.5){upObj.image_index = 0; downObj.image_angle = 90; downObj.y += 8;}
	//67.5
	if(direction < 67.5 && direction > 22.5){upObj.image_index = 1; downObj.image_angle = 135;}
	//112.5
	if(direction < 112.5 && direction > 67.5){upObj.image_index = 2; downObj.image_angle = 180;}
	//157.5
	if(direction < 157.5 && direction > 112.5){upObj.image_index = 3; downObj.image_angle = 225;}
	//202.5
	if(direction < 202.5 && direction > 157.5){upObj.image_index = 4; downObj.image_angle = 270; downObj.y += 8;}
	//247.5
	if(direction < 247.5 && direction > 202.5){upObj.image_index = 5; downObj.image_angle = 315;}
	//292.5
	if(direction < 292.5 && direction > 247.5){upObj.image_index = 6; downObj.image_angle = 0;}
	//337.5
	if(direction < 337.5 && direction > 292.5){upObj.image_index = 7; downObj.image_angle = 45;}
	
