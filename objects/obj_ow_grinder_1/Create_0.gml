//spawn in at 32x32, make sure there's enough room for it (64x64)
//will need to build a new instantiator just for enemy tiles so that enemies
//can be paired with spawn tiles. actually spawn in a enemy spawner block that will be paired w/ the enemy
// keep distance pairings with the spawn tile and the spawned enemy so if enemy and tile OOB, despawn 
//if player not detect (LOS), idly bore offscreen, in a semi-randomized direction SOMEWHAT towards the player 
//(about a 180 degree span). randomly pause, and afterwards randomly choose new direction
//if player detect (LOS) then move towards. if collide with terrain, begin bore 
//bore behaves sort of like how the player bores, however, each block destroyed will be placed behind the borer 
//also there will be no slow down when boring multiple rocks
//rocks will spawn directly behind. if spot directly behind is occupied, random local, place, if also full, repeat,
//etc
//to keep errors from popping up, doesn't have actual block collision but will simply have boreing code that makes
//itt stop and eat through any rock it's front collider touches

//we'll start with basic tracking and drilling code first though 
//need behavior for hitting supeheated walls. currently stop gap to keep them from boring into them 

//todo:
//X update collider; needs to be a flat square that rotates with the grinder, flat face forwards
//give timer based idle bahaviors so it will stop grinding, back up, turn, and move in a dif direction 
//basically have it back up X, turn by X degrees (90 +) in random direction, then moveforwards again 
//needs to work with radar; visible when scanned over, other wise invsible. also, blocks light like a shadow
//needs accel / decel
//needs to turn away from heated all as opposed to just stopping 
//needs stun behavior 

target = obj_ow_player_tank;

chasing = false;
timer = 0;
idleTimer = 0;
idleInterval = 720;
behaveChange = true;
backUpTimer = 0;
backUpTimerMax = 60;

drillArray = ds_list_create();

dir = 0;
spd = 0.5;
topSpd = 0.5;
slowSpd = 0.05;
drillDamage = 1;
drilling = false;

var rand = irandom_range(-45,45);

angleDir = point_direction(x,y,target.x,target.y) + rand;
updateAngle = 0;

drillCollider = instance_create_depth(x,y,depth,obj_ow_generic);
drillCollider.sprite_index = sp_grinderface_32x16;
visualSp = instance_create_depth(x,y,depth,obj_ow_generic);
visualSp.sprite_index = sp_grinder_test_2;
visualSp.image_speed = 0;

tilerUpdate = false;

HP = 50;

//tailObj = instance_creat_depth(); //for later once we start making grub tails 
//size, 32x64
