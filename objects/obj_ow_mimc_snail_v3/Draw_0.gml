//death animation as well as sprite and arm draws 

image_alpha = 1;
draw_self();

var tempPX = endpointX;
var tempPY = endpointY;
endpointX = handPointX;
endpointY = handPointY;

if(state = 6)
{
	//visualSp.death = true;
	if(dTimer < dTime *2)
	{
		dTimer ++;
	}
	else
	{
		death2 = true;
	}
	
	if(dTimer > dTime)
	{
		if(death2 = false || HP > 0)
		{
			var xxscale = ((dTimer-dTime)* 0.0033) *2;
			var yyscale = ((dTimer-dTime)* 0.0033) *2;
		
			if(dFrame <= dFrameTot)
			{
				dFrame += dFrameGain;
				draw_sprite_ext(sp_death_splat_2,dFrame,x+16,y+16,xxscale,yyscale,dDir,c_white,1);
				HP = 150;
			}
			else
			{
				d2Frame += d2FrameGain;
				draw_sprite_ext(sp_death_splat_pulse,d2Frame,x+16,y+16,xxscale,yyscale,dDir,c_white,1);
			}
		}
	}
	else
	{
		//visualSp.image_angle += irandom_range(-10,10);
	}	
}

var startPX = x +16+ lengthdir_x(16,myDir);
var startPY = y +16+ lengthdir_y(16,myDir);

var spDir = 0;
var visSp = 0;
xx = x+16;
yy = y+16;

if(state = 0)
{
	var xx = x;
	var yy = y;
	visualSp.sprite_index = sp_block_rock;
	visualSp.image_index = 0;
	spDir = 0;
	visSp = spDir;
}

if(state = 1)
{
	var xx = x;
	var yy = y;
	if(fullEmerge)
	{
	var xx = x+16;
	var yy = y+16;
	}
}

if(state = 2)
{
	spDir = 0;
	visSp = spDir + 90;
}

if(state = 3)
{
	spDir = myDir;
	visualSp.sprite_index = sp_mimic_body_idle;
	visSp = spDir+90;
}

//spDir = myDir;

if(state = 4 || state = 5 || state = 6)
{
	spDir = myDir + 270;
}


draw_sprite_ext(sp_mimic_foot,0,x+16,y+16,buttScale,buttScale,spDir+90,c_white,1); //change scale based on foot animations 
draw_sprite_ext(sp_mimic_hand, armStp, startPX, startPY, buttScale, buttScale, spDir, c_white, 1);
visualSp.image_angle = visSp;
visualSp.x = xx;
visualSp.y = yy;



//draw text endpoints
//draw text pullback
//draw text swipe timer
//DEBUG:
/*
draw_text(x,y,state);
draw_text(x,y+24,swipeTimer);
var tPoint = point_direction(x,y,target.x+14,target.y+14);
		var stX = x+lengthdir_x(64,tPoint+30);
		var stY = y+lengthdir_y(64,tPoint+30);
		var enX = x+lengthdir_x(64,tPoint-30);
		var enY = y+lengthdir_y(64,tPoint-30);
draw_text(x,y+48,endpointX);
draw_text(x,y+72,endpointY);
draw_circle(stX,stY,2,false);
draw_circle(enX,enY,2,false);
draw_circle(endpointX,endpointY,4,false);
*/

//draw_circle(startPX,startPY,4,false);
//draw_circle(centerDirX,centerDirY,4,false);
//draw_circle(endpointX,endpointY,4,false);

//draw_text(x,y-64,animTimer);
//draw_text(x,y+32,startX);
//draw_text(x,y+56,pincerL.image_angle);
//draw_text(x,y+80,pincerR.image_angle);
//draw_text(x,y+104,myDir);

//endpointX = tempPX;
//endpointY = tempPY;