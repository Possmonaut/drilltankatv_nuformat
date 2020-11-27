draw_self();



//here at the bottom we'll update the positions for the drill, the drill sprite, and the player sprite
//also update the bump, the up down of the sprite, and it's frame data 
currGear = string(round(velocity));

if(currGear == lastGear)
{
visualSpriteTank.x = x + 16;
visualSpriteTank.y = y + 16;
visualSpriteDrill.x = x+16;
visualSpriteDrill.y = y+16;
gearTimer = timer + 4;
}
else
{
	if(gearTimer <= timer)
	{
		lastGear = currGear;
	}
}

if(rotateUpdate <= timer)
{
visualSpriteDrill.image_angle = angleDir + 270;
visualSpriteTank.flashlight.image_angle = angleDir + 270;
//draw_circle( x + 16 +  lengthdir_x(32, angleDir), y + 16 + lengthdir_y(32,angleDir), 2, false);
//draw_circle( x + 16 +  lengthdir_x(24, angleDir - 35), y + 16 + lengthdir_y(24,angleDir - 35), 2, false);
//draw_circle( x + 16 +  lengthdir_x(24, angleDir + 35), y + 16 + lengthdir_y(24,angleDir + 35), 2, false);

rotateUpdate = timer + 8;
}

centerDrillXX = x + 16 +  lengthdir_x(32, angleDir);
centerDrillYY = y + 16 + lengthdir_y(32,angleDir);

//draw_text(x, y, drillStopTimer);
//draw_text(x, y - 20, drillArrayC);
//draw_text(x, y - 40, drillArray[2]);

/*
if(instance_position(mouse_x, mouse_y, obj_ow_enemy_parent) != noone)
{
	draw_text_color(x - 20,y, instance_position(mouse_x, mouse_y, obj_ow_enemy_parent), c_red, c_red, c_red, c_red,1);
	var target = instance_position(mouse_x,mouse_y,obj_ow_enemy_parent);
	target.HP --;
}
*/


//draw_text_color(x - 20,y, debug1, c_red, c_red, c_red, c_red,1);

RPosX = x + 16 +  lengthdir_x(32, angleDir);
RPosY = y + 16 + lengthdir_y(32,angleDir);

//if player health <= 0, flash a few times, last 3 frames make player sprite expand slightly
//then on last flash frame, when flashAlpha = 0, create a BUNCH of rock blast particles from central point
//and delete player sprite object and goto game over screen
//do NOT delete actual player object or you're gonna get a bunch of obnoxious bugs
//player deathscreen object can maybe just be the title screen with some modified code
//once you start using black and white images for stuff, can probably make b+w of teeth with contrast turned up high. it'll be creepy

if(HP <= 0)
{
	obj_ow_player_tank_sp.playerDeath = true;
	velocity = 0;
	//later, change this to disable controls and drain velocity to 0
}