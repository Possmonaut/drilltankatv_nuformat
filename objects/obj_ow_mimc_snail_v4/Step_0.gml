if(state = 3)
{
 // dashTimer ++;
  
  pincerL.image_angle = myDir + jawAngGain;
  pincerR.image_angle = myDir - jawAngGain;
  
  var xx = target.x+14+lengthdir_x(14,target.angleDir);
  var yy = target.y+14+lengthdir_y(14,target.angleDir);
  cDur = point_direction(x+16,y+16,xx,yy);
  
  if(myDir <= cDur+10 && myDir >= cDur-10)
  {
    dash = true;
  }
  
  if(dash = true)
  {
	  dashTimer ++;
	  		if(jawAngGain < 45)
		{
			//pincerL.image_angle = myDir + jawAngGain;
			//pincerR.image_angle = myDir - jawAngGain;
			jawAngGain += 2;
		}
		
		if(!audio_is_playing(myAudM) || myAudM = -1)
		{
			myAudM = audio_play_sound(so_grinder_chase,1,false);
			audio_sound_gain(myAudM,0.25,0);
			audio_sound_pitch(myAudM,3);
		}
  }
  
  if(dash = false)
  {
    if(myDir > 360){myDir = 0;}
    if(myDir < 0){myDir = 360;}

    if(angle_difference(myDir, cDur) > 0 ){
    myDir = myDir - durSpd;
    }

    if(angle_difference(myDir, cDur) < 0 ){
    myDir = myDir + durSpd;
    }
  }
  
  if(dashTimer > updateInterval*3 && dash = true)
  {
    velocity = spd;
    dashTimer = 0;
	dash = false; //<<<<<<<<<<<<<<<<< last added item
	if(instance_exists(atkCollider) && atkCollider != -1)
    {
		instance_destroy(atkCollider);
    }
    atkCollider = instance_create_depth(x,y,depth-1,obj_ow_mimc_snail_strike);
    atkCollider.progen = id;
	var b = audio_play_sound(so_swim_swish,1,false);
	var r = random_range(0.8, 1.4);
	audio_sound_gain(b,0.5,0);
	audio_sound_pitch(b,r);
    
  }
  
  if(instance_exists(atkCollider)) //generate attack
  {
      atkCollider.x = x+16+lengthdir_x(24,myDir);
      atkCollider.y = y+16+lengthdir_y(24,myDir);
      atkCollider.image_angle = cDur;
  }


  if(velocity > 0)
  {
    velocity -= veloDecay;
	dashTimer = 0;
			if(jawAngGain > 0)
		{
			//pincerL.image_angle = myDir + jawAngGain;
			//pincerR.image_angle = myDir - jawAngGain;
			jawAngGain -= 4;
		}
  }

	if(velocity <= 0)
	{
		dash = false;
	}

  x+=cos(myDir*2*pi/360)*velocity;
  y+=-sin(myDir*2*pi/360)*velocity;
}
else
{
  velocity = 0;
  dashTimer = 0;
  dash = false;
  if(instance_exists(atkCollider) && atkCollider != -1 && state != 1)
  {
	instance_destroy(atkCollider);
  }

}

if(fullEmerge) //position arms 
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
  jawLPEX = x+16+lengthdir_x(32*image_xscale,spDir+45);
  jawLPEY = y+16+lengthdir_y(32*image_xscale,spDir+45);

  jawRPEX = x+16+lengthdir_x(32*image_xscale,spDir-45);
  jawRPEY = y+16+lengthdir_y(32*image_xscale,spDir-45);

  pincerL.x = jawLPEX;
  pincerL.y = jawLPEY;

  pincerR.x = jawRPEX;
  pincerR.y = jawRPEY;
  
  detectRange = activeRange;

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

detectRange = hidingRange;
}