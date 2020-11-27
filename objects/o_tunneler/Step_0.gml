for(var i = 0; i < 18; i ++)
{
	var xx = x+lengthdir_x(bRad-1,(i+1)*20);
	var yy = y+lengthdir_y(bRad-1,(i+1)*20);
	botCircle[# i, 0] = xx;
	botCircle[# i, 1] = yy;
}

for(var i = 0; i < 18; i ++)
{
	var xx = mX+lengthdir_x(mRad-1,(i+1)*20);
	var yy = mY+lengthdir_y(mRad-1,(i+1)*20);
	midCircle[# i, 0] = xx;
	midCircle[# i, 1] = yy;
}

for(var i = 0; i < 18; i ++)
{
	var xx = x+lengthdir_x(tRad-1,(i+1)*20);
	var yy = y+lengthdir_y(tRad-1,(i+1)*20);
	topCircle[# i, 0] = xx;
	topCircle[# i, 1] = yy;
}

if(keyboard_check(vk_up)){mY --;}
if(keyboard_check(vk_down)){mY ++;}
if(keyboard_check(vk_left)){mX --;}
if(keyboard_check(vk_right)){mX ++;}