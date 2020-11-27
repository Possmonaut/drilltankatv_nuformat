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
		HP = 150;
	}
	else
	{
		death2 = true;
	}
	
	if(dTimer > dTime)
	{
		if(death2 = false || HP > 0)
		{
		var xxscale = (dTimer-dTime)* 0.0033;
		var yyscale = (dTimer-dTime)* 0.0033;
		draw_sprite_ext(sp_grinder_splat,0,x+16,y+16,xxscale,yyscale,0,c_white,1);
		}
	}
	else
	{
		//visualSp.cDur += irandom_range(-10,10);
	}
	
}

var startPX = x +16+ lengthdir_x(16,cDur);
var startPY = y +16+ lengthdir_y(16,cDur);

//length from base to endpoint
armLength = point_distance(startPX,startPY,endpointX,endpointY);
halfLength = point_distance(startPX,startPY,endpointX,endpointY) / 2;

//halfway between base to endpoint
centerPointX = startPX + lengthdir_x(halfLength,point_direction(startPX,startPY,endpointX,endpointY));
centerPointY = startPY + lengthdir_y(halfLength,point_direction(startPX,startPY,endpointX,endpointY));

//solves for midpoint using pythag theorem
var lengthCalc1 = sqr(jointLength/2) - sqr(halfLength);
lengthCalc1 = abs(lengthCalc1);
var lengthCalc2 = sqrt(lengthCalc1);

//direction and point 90 degrees from the centerpoint
centerDirX = centerPointX + lengthdir_x(lengthCalc2,point_direction(startPX,startPY,endpointX,endpointY) - (90));
centerDirY = centerPointY + lengthdir_y(lengthCalc2,point_direction(startPX,startPY,endpointX,endpointY) - (90));

//distance between middle of armLength and the point 90 degrees above
midLength = point_distance(centerPointX,centerPointY,centerDirX,centerDirY);

midjointX = centerDirX;
midjointY = centerDirY;

var armF = 1 * armType;
var armOfst = 415;
if(armType = -1)
{
	armOfst = 125;
}

//var newMidX = startPX + lengthdir_x(halfLength,point_direction(startPX,startPY,))

//for now, draw the "shell" as a normal block, and then have it swap out for the boiled shell
//after the emerge animation

//armDirBase = point_direction(x,y,midjointX,midjointY) + armOfst;
//armDirMid = point_direction(midjointX,midjointY,endpointX,endpointY) + 270;
armDirBase = point_direction(startPX,startPY,midjointX,midjointY);
armDirMid = point_direction(midjointX,midjointY,endpointX,endpointY);
draw_sprite_ext(sp_mimic_up_arm, 0, startPX,startPY, armScale, armScale, armDirBase, c_white, 1);
draw_sprite_ext(sp_mimic_low_arm, 0, midjointX, midjointY, armScale, armScale, armDirMid, c_white, 1);
var handSwipe = cDur;
if(state = 1)
{
	handSwipe = armDirMid
}
draw_sprite_ext(sp_mimic_hand, armStp, endpointX, endpointY, armScale, armScale, handSwipe, c_white, 1);


var spDir = 0;
xx = x+16;
yy = y+16;

if(state = 0)
{
	var xx = x;
	var yy = y;
	visualSp.sprite_index = sp_ping_block_general;
	spDir = 0;
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
}

if(state = 3)
{
	spDir = cDur;
	visualSp.sprite_index = sp_mimic_body_idle;
}

draw_sprite_ext(sp_mimic_foot,0,x+16,y+16,buttScale,buttScale,spDir+90,c_white,1); //change scale based on foot animations 
visualSp.image_angle = spDir;
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
//draw_text(x,y+56,startY);
//draw_text(x,y+80,x);
//draw_text(x,y+104,y);

endpointX = tempPX;
endpointY = tempPY;