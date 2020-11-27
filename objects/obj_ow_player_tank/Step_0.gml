//bigAssBG.x = x-512;
//bigAssBG.y = y - 384;
if(x+14 < 0){OOB = true;}
if(y+14 < 0){OOB = true;}
if(x+14 > room_width){OOB = true;}
if(y+14 > room_height){OOB = true;}

if(x+14 < -512){x = room_width+512-14;}
if(y+14 < -512){y=room_height+512-14;}
if(x+14 > room_width+512){x = -512 + 14;}
if(y+14 > room_height+512){y = -512 + 14;}

if(velocity > 0)
{
	sc_shake_call(velocity*0.2,60,true);
	if(velocity > axMaxFSpeed){obj_ow_camera.centerShake = true;}
}

colliderDrill.x = x + (sprite_width * 0.5) + lengthdir_x(sprite_width * 0.5,angleDir); //we can change this later to just be built into the tank 
colliderDrill.y = y + (sprite_height * 0.5)+ lengthdir_y(sprite_height * 0.5,angleDir);
colliderDrill.image_angle = angleDir+90;

if(position_meeting(colliderDrill.bbox_left,colliderDrill.bbox_top,obj_ow_nopass)){inRock = true;} //fix this to use drill collider
if(position_meeting(colliderDrill.bbox_right,colliderDrill.bbox_top,obj_ow_nopass)){inRock = true;}
if(position_meeting(colliderDrill.bbox_left,colliderDrill.bbox_bottom,obj_ow_nopass)){inRock = true;}
if(position_meeting(colliderDrill.bbox_right,colliderDrill.bbox_bottom,obj_ow_nopass)){inRock = true;}

var x1 = x + 12 + lengthdir_x(12,angleDir); //for our pickup hitbox
var y1 = y+ 12 +  lengthdir_y(12,angleDir);

var x2 = x1 + lengthdir_x(36,135);
var y2 = y1 + lengthdir_y(36,135);

pickupCollider.x = x2;
pickupCollider.y = y2;

collisionVeloX= cos(angleDir*2*pi/360)*velocity; //generate these same values for the drill collider, but from the lengthdir
collisionVeloY= -sin(angleDir*2*pi/360)*velocity;

xVelo = velocity;
yVelo = velocity;

var pmX = instance_position(x + collisionVeloX, y, obj_ow_nopass);
var pmY = instance_position(x, y + collisionVeloY, obj_ow_nopass);
var pmCollideX = false;
var pmCollideY = false;

if(instance_exists(pmX))
{
	if(pmX.collision = true)
	{
		pmCollideX = true;
	}
}

if(instance_exists(pmY))
{
	if(pmY.collision = true)
	{
		pmCollideY = true;
	}
}

//if(drillOn = false && inRock = false) //3/7/2020
//{

if(place_meeting(x + collisionVeloX, y, obj_ow_nopass)){
	while(!place_meeting(x+ collisionVeloX,y,obj_ow_nopass))
	{
		x+=collisionVeloX;
	}
	
	xVelo = 0; //if you want to be able to slide along the wall, you'll need to seperate velocities into 
	//x and y velocities
	againstWall = true;
	
}

if(place_meeting(x, y + collisionVeloY, obj_ow_nopass)){
	while(!place_meeting(x, y+collisionVeloY,obj_ow_nopass))
	{
		y+=collisionVeloY;
	}
	
	againstWall = true;
	yVelo = 0;
}

//}

x+=cos(angleDir*2*pi/360)*xVelo;
y+=-sin(angleDir*2*pi/360)*yVelo;
	
	
	if(againstWall = false && collision = false)
	{
		collision = true;
	}
	
	if(collision = true && againstWall = true)
	{
		collision = false;
		audio_play_sound(so_rock_break,2,false);
		sc_shake_call(1,2,true);
	}
	
	if(againstWall = true)
	{ if(velocity > (maxFSpeed * 0.25))
		{
			velocity = (maxFSpeed * 0.25);

		}
				againstWall = false;
	}
	
//creates dust. rebuild this to be a particle effect
if(visualJumptimer <= timer) //you should probably shift the drill position code to the above section when you revamp it for the new drill 
//actually, make it a script then just call it here, and after turning for smoother effect. or have the above resert the jump timer
{
	//produce smoke from two points, the treads, using the lengthdir function		
	if(velocity > 0)
	{
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir-160), y + 16 + lengthdir_y(16,angleDir-120), global.dustPuff, 1);
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir+160), y + 16 + lengthdir_y(16,angleDir+120), global.dustPuff, 1);
	}
	
	if(velocity < 0)
	{
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir-70), y + 16 + lengthdir_y(16,angleDir-30), global.dustPuff, 1);
		part_particles_create(global.P_System, x + 16 +  lengthdir_x(16, angleDir+70), y + 16 + lengthdir_y(16,angleDir+30), global.dustPuff, 1);
	}
	visualJumptimer = timer +10;
}


//biiiiiiiiig chunk of drill code. rework all of this 

//intunnel check start
	var inTunnCheck = 0; //all this just checks if we have blocks on any two opposite sides. if true, we're in a tunnel

	for(var i = 0; i < 2; i ++)
	{
		var p1x = x + 14 + lengthdir_x(32,angleDir + (i*90));
		var p1y = y + 14 + lengthdir_y(32,angleDir + (i*90));
		var p2x = x + 14 + lengthdir_x(32,angleDir + (i*90)+180);
		var p2y = y + 14 + lengthdir_y(32,angleDir + (i*90)+180);
	
		var cP1 = collision_point(p1x,p1y,obj_ow_nopass,false,true);
		var cP2 = collision_point(p2x,p2y,obj_ow_nopass,false,true);
	
		if(cP1 != noone && cP2 != noone)
		{
			inTunnCheck ++;
		}
	}
	
	if(inTunnCheck > 0)
	{
		inTunnel = true;
	}
	else
	{
		inTunnel = false;
	}
//intunnel check end 


	if(drillOn && colliderDrill.jammed = false){ //this is the code for digging rocks, yee

		drilling = false;

		for(var i = 0; i < 4; i ++) //this takes collided rocks from the drill collider and adds them to the drill list
		{
			if(colliderDrill.crnrArray[|i] != -4)
			{
				drillArray[i] = colliderDrill.crnrArray[|i];
				drillHeat += drillHeatGain;
				drilling = true;
			}
			else
			{
				drillArray[i] = 0;
			}
		}
		
		for(var i = 4; i < 8; i ++) //this takes collided ENEMIES from the drill collider and adds them to the drill list
		{
			if(colliderDrill.crnrArray[|i] != -4)
			{
				drillArray[i - 4] = colliderDrill.crnrArray[|i];
				if(drillOn){drillHeat += drillHeatGain;}
				drilling = true;
			}
			else
			{
				if(drillArray[i -4] != -4)
				{}
				else
				{
				drillArray[i - 4] = 0;
				}
			}
		}
				 
				 for(var i = 0; i < 4; i ++) //this loop will jump to the next option if the current one is 0
				 {
					 if(drillArray[drillArrayC] = 0 || drillArray[drillArrayC] = -4)
					 {
						 drillArrayC ++;
						 if(drillArrayC > 3){drillArrayC = 0;}
					 }
					 else
					 {
						 i = 4;
					 }
				 } //at the bottom of all of this, drillArrayC will be incrimented
				 
				 var instTest = instance_exists(drillArray[drillArrayC]); //this way we won't crash if the inst got wrecked by something else 
				 
				if(drillArray[drillArrayC] > 0 && instTest)
				{
					
					var target = drillArray[drillArrayC];
					debug1 = target;
					//if(target = obj_ow_enemy_parent){target.stunned = true;} //also have it spray blood instead of sparks
					var crackTarg = 0;
					
					if(object_is_ancestor(target.object_index,obj_ow_rock_parent) && target.object_index != obj_ow_spore_chimney)
					{
						crackTarg = instance_position(target.x+16,target.y+16,obj_ow_timer_generic);
						if(crackTarg = noone)
						{
							crackTarg = instance_create_depth(target.x+16,target.y+16,48,obj_ow_timer_generic);
							crackTarg.sprite_index = sp_rock_cracks;
							crackTarg.image_angle = point_direction(target.x+16,target.y+16,x+14,y+14);
						}
						crackTarg.image_index = 5 + (-1 * (target.HP/20))
					part_type_direction(global.rockSpark,angleDir + 135, angleDir + 225,0,0);
					part_system_depth(global.P_System,depth-1);
					part_particles_create(global.P_System, colliderDrill.x, colliderDrill.y, global.rockSpark, 2);
					part_type_direction(global.rockSpark, 0, 359, 0, 0);
					//part_system_depth(global.P_System, obj_ow_particle_handler.depth);
					}
					
					if(object_is_ancestor(target.object_index,obj_ow_enemy_passable) || target.object_index = obj_ow_spore_chimney)
					{
						part_particles_create(global.P_System, colliderDrill.x, colliderDrill.y, global.blood, 1);
					}
					
					drillDamage = (drillBaseDam -1) + (drillStopTimer * 0.0166); //drilldamage = drill speed. if going too slow, add 0.5
					if(overHeat = true)
					{
					drillDamage = drillDamage + ((drillHeat - 100) * 0.05)
					}
					
					tDraw = target;
					if(drillStopTimer > 30){drillStopTimer += irandom_range(-4,2);}
					if(drillAccel > 0){drillAccel -= drillAccVar;}
					sc_shake_call(1.5,1,true);
					if(target.object_index = obj_ow_superheated_wall){drillHeat += 0.10;} //if we're drilling into lava, gain xtra heat. later, add smoke too
					if(target.object_index = obj_ow_rockswimmer_segment)
					{
						//target.progen.HP -= drillDamage;
						target = target.progen;
					}
					target.HP -= drillDamage;
					if(target.HP <= 0){
						if(object_is_ancestor(target.object_index,obj_ow_rock_parent)){
						part_particles_create(global.P_System, target.x +16, target.y +16, global.rockDeath, 8);}
						//if(target.object_index = obj_ow_block_supsat){target.cDest = true;}
						destTic ++;
						var xx = tilemap_get_cell_x_at_pixel(global.Tiles_1, target.x, target.y+global.blockGenofst);
						var yy = tilemap_get_cell_y_at_pixel(global.Tiles_1, target.x, target.y+global.blockGenofst);
						tilemap_set(global.Tiles_1, 0, xx, yy);
						tilemap_set(global.Shadow_Lower,0,xx,yy); //sets the lower shadow to 0
						if(target.dsTrig = true){instance_create_depth(target.x,target.y,target.depth,target.deathSpawn);}
						if(target.tsTrig = true){tilemap_set(global.Tiles_1,target.tileSpawn,xx,yy);}
						var pingDest = instance_position(target.x,target.y,obj_ow_ping_block);
						instance_destroy(pingDest);
						
						if(!object_is_ancestor(target.object_index,obj_ow_enemy_passable)){ //if we're an enemy, trigger death so they can play death anims
						instance_destroy(target);}
						else
						{
							target.death = true;
						}

						
						if(variable_instance_exists(target,"deathAudio"))
						{	
							if(!audio_is_playing(deathAudTemp))
							{	
							deathAudTemp = audio_play_sound(target.deathAudio,1,false);
								if(deathAudTemp = so_rock_break)
								{
									audio_sound_gain(deathAudTemp,2,0);
								}
							}
						}

						for(var l = 0; l < 3; l++)
						{
							for(var k = 0; k < 3; k ++)
							{   //below code adds a block to the map
							var x2 = (xx*3) + l; //was originally xx * 4 + l, same for below
							var y2 = (yy*3) + k;
							global.mapGrid[# x2, y2] = 0;
							}
						}
						obj_ow_mapper_test_2.update = true;
						obj_ow_auto_tile_dark.update = true;
						obj_ow_Los_check_grid_dark.update = true;
						drillArray[drillArrayC] = 0;
						destTic ++;
						}
					}
				}
				
				drillTimer = timer + 30;
				drillArrayC ++;
				if(drillArrayC > 2){drillArrayC = 0;}

if(drillHeat > maxTemp){drillHeat = maxTemp;}

if(drillHeat >= safeTemp)
{	
	oHeatTimer ++;
	if(oHeatTimer > oHeatTime)
	{
	HP -= 0.025; 
	if(drillHeat >overTemp)
	{HP -= 0.025;}
	obj_ow_player_tank_sp.damageFlash = true;
	overHeat = true;
	}	
}
else
{
	overHeat = false;
	oHeatTimer = 0;
}

if(instance_position(x+14,y+14,obj_ow_superheated_floor) || OOB = true)
{
	//HP -= 0.025;
	if(drillHeat < 99)
	{
		//replace this with a better exponential function later
		if(drillHeat < 25)
		{
			drillHeat += 0.5;
		}
		if(drillHeat < 50)
		{
			drillHeat += 0.25;
		}
		drillHeat += 0.05;
	}
	obj_ow_player_tank_sp.damageFlash = true;
	HP -= 0.025; 
	OOB = false;
	slowed = true;
	inMagma = true;
	spoolTimer ++;
	if(spoolTimer > spoolTime)
	{
		part_particles_create(global.P_System, x+14, y+14, global.sparkParticle, 8);
		spoolTimer = 0;
		spoolTime = irandom_range(60,120);
	}
}
else
{
	slowed = false;
	inMagma = false;
}

if(key_drill = false){drillHeat -= 0.02;}
if(drillHeat < 0){drillHeat = 0;}

//inRock = false;

