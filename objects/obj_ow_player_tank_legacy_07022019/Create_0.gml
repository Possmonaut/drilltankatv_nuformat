global.debugOn = false;

//if(global.debugOn = true){image_alpha = 0.5;}
//else{image_alpha = 0;}

image_alpha = 1;

//default depth is 0
//depth = -100;
visualSpriteTank = instance_create_depth(x + 16, y +16, -2, obj_ow_player_tank_sp);
visualSpriteDrill = instance_create_depth(x +16, y +16, -2, obj_ow_tank_sp_drill);
colliderDrill = instance_create_depth(x, y -32, depth, obj_ow_tank_drill);

draw_set_font(pixelette16);

var l = layer_get_id("collision_map");
tilemap = layer_tilemap_get_id(l);

alartTest = false; //used to turn the object on / off

movespeed = 32;

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);

timer = 0; //times everything 
accelTimer = 0; //pauses between acceleration / deceleration / turning
turnTimer = 0;
turningTimer = 0; //pauses movement while rotating
visualTurningTimer = 0;
turning = 0; //0 = not turning, 1 = right, 2 = left
jumpTimer = 0; //measures between pixel hops

dir = 0; //0 = up 1 = right 2 = down 3 = left
facing = 0; //same as dir, but only controls the facing for collision detection
rotateFrame = 0; //frame for tank rotation sprite
spriteRotate = 0; //angle for flashlight
forwardSpeed = 0; //maximum speed. 0 = no movement, 1 = half speed, 2 = full speed
drillTimer = 0; //sets the damage per second
drillOn = false; //if drill is dealing damage
drillDamage = 1; //base damage of drill
visualJumptimer = 0; //for the movement of the tanksprite
slowing = false; //if slowing from 2 to 0
keyOff = true; //check for key release on turn

stopTimer = false;
stopTimerTimer = 0;
stopPause = false;

collision = false; //did we slam into something?
againstWall = 0; // are we against something?
decel = false; //stores deceleration commands

drillStop = false;
drillStopTimer = 0;
drillHeat = 0;
drilling = false; //are we drillin' or uh

//below this point are variables you should add in later for ease of modification
topSpeed = 0;
rammingSpeed = 2.5;
rammingBonus = 3;

activeBomb = 0;
blastTriggerDelay = 0;

debug1 = 0;
debug2 = 0;
debug3 = 0;
debug4 = 0;

ringCollider1 = instance_create_depth(x + 16, y + 16, 10, obj_ring_collider1);
ringCollider2 = instance_create_depth(x + 16, y + 16, 20, obj_ring_collider2);
ringCollider3 = instance_create_depth(x + 16, y + 16, 30, obj_ring_collider3);
ringCollider4 = instance_create_depth(x + 16, y + 16, 40, obj_ring_collider4);
ringCollider5 = instance_create_depth(x + 16, y + 16, 50, obj_ring_collider5);
ringCollider6 = instance_create_depth(x + 16, y + 16, 10, obj_ring_collider6);
ringCollider7 = instance_create_depth(x + 16, y + 16, 20, obj_ring_collider7);
ringCollider8 = instance_create_depth(x + 16, y + 16, 30, obj_ring_collider8);
ringCollider9 = instance_create_depth(x + 16, y + 16, 40, obj_ring_collider9);
ringCollider10 = instance_create_depth(x + 16, y + 16, 50, obj_ring_collider10);

