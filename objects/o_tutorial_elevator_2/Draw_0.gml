//draw_sprite(sp_bigassBlackBG,0,x-960,y-540);
draw_sprite_ext(sp_tunnel_ring_hole,0,x,y,0.4,0.4,0,c_white,1);
bigassBG.x = x-960;
bigassBG.y = y-540;

//image_index += iSpd;

//draw_circle(mX,mY,mRad,true);
//draw_set_color(c_black);
//draw_circle(mX,mY,mRad-20,false);
//draw_set_color(c_white);

/*
draw_circle(x+xOfst,y+yOfst,bRad,true);
for(var i= 0;i < 18; i++)
{
	draw_line(botCircle[# i, 0],botCircle[# i, 1],midCircle[# i,0],midCircle[# i,1]);
}

for(var i= 0;i < 18; i++)
{
	draw_line(midCircle[# i,0],midCircle[# i,1],topCircle[# i,0],topCircle[# i,1]);
}
draw_circle(x+xOfst,y+yOfst,tRad,true);




/*
bot, middle, top
bot / top a stable until we mod them
middle shifts randomly
sent circles up from bottom that will move to meet middle then move to meet top

*/



if(aRad <= mRad)
{
aRad += (bRad / tRad) * spd;
aX = lerp(x+xOfst, mX, aRad / tRad);
aY = lerp(y+yOfst, mY, aRad / tRad);
}
else
{
	aRad += (bRad / tRad) * spd;
	aX = lerp(mX, x+xOfst, aRad / tRad);
	aY = lerp(mY, y+yOfst, aRad / tRad);
}

if(aRad > tRad)
{
	aRad = bRad;
	aX = x+xOfst;
	aY = y+yOfst;
	
}

//draw_circle(aX,aY,aRad,true);

/*
tunnelTimer ++;
if(tunnelTimer > tunnelTime)
{
	instance_create_depth(x,y,depth+1,obj_ow_tunnel_ring);
	tunnelTimer = 0;
}
*/

/*
if(activeTunnel.size > 0.1)
{
	activeTunnel = instance_create_depth(x,y,depth+1,obj_ow_tunnel_ring);
}
*/

if(tunnelList[|0].size > 2.5)
{
	instance_destroy(tunnelList[|0]);
	ds_list_delete(tunnelList,0);
	var b = instance_create_depth(x,y,depth+1,obj_ow_tunnel_ring);
	ds_list_add(tunnelList, b);
		if(onBoard && target.controlPause = true && shakeTimer >= shakeInterval)
		{
		//sc_shake_call(5,5,true);
		//var b = audio_play_sound(so_elevator_bump,1,false);
		//audio_sound_gain(b,0.5,0);
		}
}

tunnelList[|0].size += 0.005;

for(var i=1; i<3;i++)
{
	tunnelList[|i].size = tunnelList[|i-1].size * 0.35;
}




draw_self();
engineInt += enginIntGain;
draw_sprite_ext(sp_test_TD_elevator_legacy_engine,engineInt,x,y,1,1,0,c_white,1);


/*
if(aRad > mRad)
{

	
		var mAlph = 1 - (aRad / tRad);
		
		draw_sprite_ext(sp_test_TD_elevator_light,0,x,y,1,1,1,c_white,mAlph);
}
*/


/*
//1 = max size, will reach in 60 frames
wallRing.image_xscale += (rSpd *2);
wallRing.image_yscale += (rSpd *2);
wallRing2.image_xscale += (rSpd *2);
wallRing2.image_yscale += (rSpd *2);
//wallRing.image_alpha = 

ringTimer ++;
lightTimer ++;

if(ringTimer > ringTime)
{
	
	if(lightTimer > lightTime)
	{
		var i = ds_list_size(ringList)-1;
		leadRing[|0].sprite_index = ringList[|i];
		leadRing[|0].image_xscale =0;
		leadRing[|0].image_yscale =0;
		leadRing[|0].image_angle = irandom(360);
		var ringID = leadRing[|0].id;
		leadRing[|0] = leadRing[|1].id;
		leadRing[|1] = ringID;
		ringTimer = 0;
		lightTimer = 0;
		lightTrigger = true;
	}
	else
	{
		var i = irandom(ds_list_size(ringList)-2);
		leadRing[|0].sprite_index = ringList[|i];
		leadRing[|0].image_xscale =0;
		leadRing[|0].image_yscale =0;
		leadRing[|0].image_angle = irandom(360);
		var ringID = leadRing[|0].id;
		leadRing[|0] = leadRing[|1].id;
		leadRing[|1] = ringID;
		ringTimer = 0;
		lightTrigger = false;
	}
	
}

if(lightTrigger = true)
{
	if(leadRing[|0].image_xscale > 1)
	{
		var mAlph = 2 - leadRing[|0].image_xscale; //fix me. needs to be at 1 and dip to 0
		
		draw_sprite_ext(sp_test_TD_elevator_light,0,x,y,1,1,1,c_white,mAlph);
	}
}
*/

/*
draw_text(x,y-128,tunnelList[|0].size);
draw_text(x,y-96,tunnelList[|1]);
draw_text(x,y-64,tunnelList[|2]);
