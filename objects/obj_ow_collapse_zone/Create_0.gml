//needs screen shake 
//needs correct transfer behaviors 

depth = 600;

timer = 0;
target = obj_ow_player_tank;
trigDist = 160;
trigTime = 120;

fallScale = 0;

animTime = 180;
fallTime = 180;


animMax = sprite_get_number(sp_collapse_zone);
animInt = animMax / animTime;

distFallCheck = 0;
disMax = sprite_get_width(sp_collapse_zone);
disInt = disMax / animTime;

sizeLoss = 0;
sizeLInt = 1/fallTime;

TPTrig = false;
TPTrigX = 67*32;
TPTrigY = 216*32;
fade = obj_ow_fade_handler;
nxtRm = rm_ocean_1;
saveWait = true;

falling = true;
fallAng = -1;
blockClear = false;

myAud = -1;