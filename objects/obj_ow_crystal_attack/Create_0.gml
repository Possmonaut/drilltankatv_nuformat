target = obj_ow_player_tank;
lifeTimer = 0;
lifeTime = 240;
windUpTime = 60; //don't deal damage until crystal is fully grown
//

animTimer = 0;
animMax = sprite_get_number(sp_monolith_mon_complt);
animInterval = (animMax)/120;
animDir = 0;

windupTime = animMax / 2;

myDir = 0;