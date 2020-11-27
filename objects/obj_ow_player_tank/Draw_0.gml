draw_self();

//draw_text(x+64,y,override);
//draw_text(x+64,y+24,drillDamage);
inRock = false;
obj_ow_camera.fathoms = 1000 + point_distance(x,y,fathomX,fathomY) * 0.1;

//here at the bottom we'll update the positions for the drill, the drill sprite, and the player sprite
//also update the bump, the up down of the sprite, and it's frame data 

visualSpriteTank.x = x + 14; //(sprite_width * 0.5) + lengthdir_x(-16,angleDir);
visualSpriteTank.y = y + 14; //(sprite_height * 0.5) + lengthdir_y(-16,angleDir);
visualSpriteTank.image_angle = angleDir + 90;

visualSpriteDrill.x = x+14;
visualSpriteDrill.y = y+14;
visualSpriteDrill.image_angle = angleDir + 90;

centerDrillXX = x + 16 +  lengthdir_x(32, angleDir);
centerDrillYY = y + 16 + lengthdir_y(32,angleDir);

RPosX = x + 16 +  lengthdir_x(32, angleDir);
RPosY = y + 16 + lengthdir_y(32,angleDir);

//if(instance_exists(tDraw) && tDraw != -1)
//{
	//var target = tDraw;
	//if(target.myAngle = -1){target.myAngle = point_direction(target.x+16,target.y+16,x+14,y+14);}
	//draw_sprite_ext(sp_rock_cracks,5 + (-1 * (target.HP/20)),target.x+16,target.y+16,1,1,target.myAngle,c_white,1);
					//you might need to move this into the draw event somehow 
//}

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
}

