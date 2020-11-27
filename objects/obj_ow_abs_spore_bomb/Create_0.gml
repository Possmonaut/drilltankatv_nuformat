//96 in size?
target = obj_ow_player_tank;
distToTarg = 32;
timer = 0;
slowDist = 72;
lifeTimer = 0;
blastTime = 180;
lifeTime = 1200
detonate = false;
bImage = sp_default_32_centered;

velocity = 4;
angleDir = 0;
collisionVeloX = 0;
collisionVeloY = 0;

wallImmune = 25;

frameGain = sprite_get_number(ctank_web) / 60;
alphaLoss = 1/120;
image_xscale = 2;
image_yscale = 2;

shiftDepth = depth+3;

image_angle = irandom(359);

alarm[0] = blastTime;

//need to play blast animation and decay animation