if(collision_line(x+16,y+16,target.x+14,target.y+14,obj_ow_nopass,false,true) = noone)
{
	activeDraw=1;
	//if(instance_exists(nlosPing)){
	//nlosPing.image_alpha = 0;
	//}
}
else
{
	activeDraw=0;
}


//if(instance_exists(nlosPing))
//{
	//if(nlosPing.image_alpha <= 0)
	//{
	//	nlosPing.x = x+16;
	//	nlosPing.y = y+16;
	//}
//}

imageInd += imageSpd + (imageSpd*2*velocity);

if(imageInd > 8)
{
	cDir = choose(0,90,180,270);
	imageInd = 0;
	cDir = cDir + angleDir;
}

draw_sprite_ext(sp_abs_spore_test,imageInd,x+16,y+16,1,1,cDir,c_white,1);

//draw_text(x,y,"ABS");