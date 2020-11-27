//timer
//when timer
//open jaws, dash at player
//if collide, deal damage
//state is 3 for chase 

//state 3 is super simple, it just check for update and if pullT is true, it move ssuper fast 

//if(cDur > 360){cDur = 0;}
//if(cDur < 0){cDur = 360;}

if(myDir > 360){myDir = 0;}
if(myDir < 0){myDir = 360;}

if(angle_difference(myDir, cDur) > 0 ){
	myDir = myDir - durSpd;
	}

if(angle_difference(myDir, cDur) < 0 ){
	myDir = myDir + durSpd;
	}


if(myDir <= cDur+5 && myDir >= cDur-5)
{
	dash = true;
}
else
{
	dash = false;
}

if(state = 3)
{
	if(stunTime < timer)
	{
	armTimer ++;
	}

	if(cDashSpd > 0.5)
	{
		cDashSpd -= cDashLoss;
		x+=cos(myDir*2*pi/360)*cDashSpd;
		y+=-sin(myDir*2*pi/360)*cDashSpd;
	}
	else
	{
		//var sDir = point_direction(x+16,y+16,target.x+14,target.y+14) + strafeAngle;
		x+=cos(myDir*2*pi/360)*cDashSpd;
		y+=-sin(myDir*2*pi/360)*cDashSpd;
		//x+=cos(sDir*2*pi/360)*(cDashSpd*2);
		//y+=-sin(sDir*2*pi/360)*(cDashSpd*2);
	}
}

if(armTimer > stpTimer && dash)
{
	state = 3; //lock us into a state to keep things from being wonky
	pullT = false;

	if(armTimer < stpTimer + 30)
	{
		//open jaws. play attack sound
		cDur = point_direction(x+16,y+16,target.x+14,target.y+14);
		jawAngGain += 4;
		pincerL.image_angle = myDir + jawAngGain;
		pincerR.image_angle = myDir - jawAngGain;
		subState = 0;
		if(armTimer = stpTimer + 29)
		{
			atkCollider = instance_create_depth(x,y,depth-1,obj_ow_mimc_snail_strike);
			atkCollider.progen = id;
		}
	}
	else
	{
		if(instance_exists(atkCollider)) //generate attack
		{
			atkCollider.x = x+16+lengthdir_x(24,myDir);
			atkCollider.y = y+16+lengthdir_y(24,myDir);
			atkCollider.image_angle = myDir;
			pincerL.image_angle = myDir + jawAngGain;
			pincerR.image_angle = myDir - jawAngGain;
		}
		else //if we hit our target, shut jaws and play hit audio
		{
		jawAngGain -= 4;
		pincerL.image_angle = myDir + jawAngGain;
		pincerR.image_angle = myDir - jawAngGain;
		}
	}
	
	if(armTimer > stpTimer + 60) //this means we dash for a full second 
	{
		
		if(cDashSpd < dashSpd)
		{
			cDashSpd += cDashGain;
		}
		x+=cos(myDir*2*pi/360)*cDashSpd;
		y+=-sin(myDir*2*pi/360)*cDashSpd;
		//path_speed  =2;
		swimAud = true;
	}
	
	if(armTimer > stpTimer + 90)
	{
		//jawAngGain -= 4;
		//pincerL.image_angle = myDir - jawAngGain;
		//pincerR.image_angle = myDir + jawAngGain;
		swimAud = false;
		//play attack audio. ideally you could play it at the end of the dash, when the jaws close,
		//or have the jaws clsoe if the collider hits the player and play the sound then 
	}
	
	if(armTimer > stpTimer + 120)
	{
		armTimer = 0;
		pullT = true;
		jawAngGain = 0;
		dash = false;
		strafeAngle = choose(-90,90);
		if(instance_exists(atkCollider))
		{
			instance_destroy(atkCollider);
		}
	}
	
	//direction = myDir;
}
else
{
	//cDur = direction;
	dartTimer ++;
	if(dartTimer > dartTime)
	{
		dartTimer = 0;
		pullT = !pullT;
	}
	
	var spDir = 0;
	
	if(state != 5 && state != 4  && state != 6)
	{
		spDir = myDir;
	}
	else
	{
		spDir = myDir + 180;
	}
		if(pincerL.image_angle != spDir + 25)
		{
			pincerL.image_angle = approach(pincerL.image_angle,spDir+45,durSpd);
		}
		
		if(pincerR.image_angle != spDir - 25)
		{
			pincerR.image_angle = approach(pincerR.image_angle,spDir-45,durSpd);
		}
		
		subState = 1;
		
		//pincerL.image_angle = myDir + 45;
		//pincerR.image_angle = myDir - 45;
		
	if(state == 5 || state == 4)
	{
		//myDir = direction + 180;	
	}
}

if(emerged) //position arms 
{
	var spDir = 0;
	
	if(state != 5 && state != 4 && state != 6)
	{
		spDir = myDir;
	}
	else
	{
		spDir = myDir + 180;
	}
	jawLPEX = x+16+lengthdir_x(16*image_xscale,spDir+45);
	jawLPEY = y+16+lengthdir_y(16*image_xscale,spDir+45);

	jawRPEX = x+16+lengthdir_x(16*image_xscale,spDir-45);
	jawRPEY = y+16+lengthdir_y(16*image_xscale,spDir-45);

	pincerL.x = jawLPEX;
	pincerL.y = jawLPEY;

	pincerR.x = jawRPEX;
	pincerR.y = jawRPEY;

}
else
{
jawLPEX = x+16;
jawLPEY = y+16;

jawRPEX = x+16;
jawRPEY = y+16;

pincerL.x = jawLPEX;
pincerL.y = jawLPEY;

pincerR.x = jawRPEX;
pincerR.y = jawRPEY;
}

if(state = 6)
{
	if(cDashSpd > 0)
	{
		cDashSpd -= 0.1;
		if(cDashSpd < 0){cDashSpd = 0;}
	}
	x+=cos(myDir*2*pi/360)*cDashSpd;
	y+=-sin(myDir*2*pi/360)*cDashSpd;
}