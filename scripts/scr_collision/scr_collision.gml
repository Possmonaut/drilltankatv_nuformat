function scr_collision(argument0, argument1, argument2, argument3) {
	var angleDir = argument0;
	var velocity = argument1;
	var myX  = argument2;
	var myY = argument3;

	var collisionVeloX= cos(angleDir*2*pi/360)*velocity;
	var collisionVeloY= -sin(angleDir*2*pi/360)*velocity;

	var xVelo = velocity;
	var yVelo = velocity;

	if(place_meeting(myX + collisionVeloX, myY, obj_ow_nopass)){
		while(!place_meeting(myX+ collisionVeloX,myY,obj_ow_nopass))
		{
			myX+=collisionVeloX;
		}
	
		if(xVelo = 3){collision = true;}
		xVelo = 0; //if you want to be able to slide along the wall, you'll need to seperate velocities into 
		//x and y velocities
		againstWall = true;
	}

	if(place_meeting(myX, myY + collisionVeloY, obj_ow_nopass)){
		while(!place_meeting(myX, myY+collisionVeloY,obj_ow_nopass))
		{
			myY+=collisionVeloY;
		}
	
		if(yVelo = 3){collision = true;}
		againstWall = true;
		yVelo = 0;
	}

	colliderDrill.x+=cos(angleDir*2*pi/360)*xVelo;
	colliderDrill.y+=-sin(angleDir*2*pi/360)*yVelo;


}
