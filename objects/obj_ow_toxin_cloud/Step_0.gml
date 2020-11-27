life --;
if(life <=0)
{
	instance_destroy();
}

if(life > 240)
{
	image_xscale += sizeGain;
	image_yscale += sizeGain;
}
else
{
image_alpha -= alphaLoss;
image_xscale -= alphaLoss;
image_yscale -= alphaLoss;
}

var clampAud = 0;
var sMod = 0.05; //set the gain mod for the bounce sound

if(collision_line(x,y,target.x+14,target.y+14,obj_ow_nopass_enemy,false,true) != noone)
{
	clampAud = 0.1;
}
else
{
	clampAud = 1;
}

var vDist = sc_gainFalloff(384, 0);
if(vDist > clampAud){vDist = clampAud;}

audio_sound_gain(myAudG,vDist*sMod,0);