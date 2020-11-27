if(animTimer < animMax)
{
animTimer += animInterval;
}

draw_sprite_ext(sp_monolith_mon_complt,animTimer,x+16,y+16,1,1,myDir,c_white,1);