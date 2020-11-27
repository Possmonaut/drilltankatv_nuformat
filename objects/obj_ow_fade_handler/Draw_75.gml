if(COMPLETE = false && forward = true)
{
	if(fAlpha < 1){fAlpha += fSpeed;}
	if(fAlpha >= 1)
	{
		COMPLETE = true;
		forward = false;
		timer = 0;
	}
}

if(fAlpha >= 1)
{
	timer++;
}

if(timer > debugTime)
{
	back = true;
	timer = 0;
}

if(COMPLETE = true && back = true)
{
	if(fAlpha > 0){fAlpha -= fSpeed;}
	if(fAlpha <= 0)
	{
		back = false;
		COMPLETE = false;
		timer = 0;
	}
	

}


if(back && COMPLETE && forward)
{
	forward = false;
}

image_alpha = fAlpha;
draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,fAlpha);

if(keyboard_check_released(vk_f5))
{
	showFps = !showFps;
	if(showFps)
	{
		draw_text(128,56,fps_real);
	}
}

if(global.debug)
{
	if(keyboard_check_released(ord("L")))
	{
	fAlpha = 0;
	}


if(instance_exists(target))
{
draw_sprite_ext(sp_bigassBlackBG,0,0,0,1,1,0,c_white,0); //change me back to fAlpha

	draw_text(128,32,string(tilemap_get_at_pixel(global.Tiles_1,target.x+14,target.y+14)));
	draw_text(128,56,fps_real);
	draw_text(128,78,"blocks: " + string(instance_number(obj_ow_nopass)));
	draw_text(128,110,"blocklist: " + string(ds_list_size(obj_ow_auto_tile_dark.blockList)));
	draw_text(128,142,"instantiator: " + string(instance_number(obj_ow_auto_tile_dark)));
	//draw_text(128,174,"grinder spawner: " + string(instance_number(obj_ow_grinder_spawner)));
	//draw_text(128,142,"override?: " + string(target.override));
	draw_text(128,174,"tanks " + string(instance_number(obj_ow_player_tank)));
	draw_text(128,206,"rm: " + string(room_get_name(room)));

draw_text(0,256,"forward:" + string(forward));
draw_text(0,288,"back:" + string(back));
draw_text(0,320,"complete:" + string(COMPLETE));
draw_text(0,352,"fAlpha:" + string(fAlpha));

draw_text(0,400,"ctronoller: " + string(gamepad_axis_value(0, gp_axislv)));
draw_text(0,424,"elevator2: " + string(obj_ow_elevator_bottom.aud_check_trig));
draw_text(0,448,"camY:" + string(camera_get_view_y(view)));
if(instance_exists(obj_ow_tutorial_controller))
{
draw_text(0,472,"inputStage:" + string(obj_ow_tutorial_controller.inputStage));
}
draw_text(0,504,"panelY: " + string(obj_ow_camera.panelY));

draw_text(0,528,"shakeDur: " + string(obj_ow_camera.shakeDur));
draw_text(0,572,"shakeForce: " + string(obj_ow_camera.shakeForce));

if(instance_exists(obj_ow_ocean_handler))
{
	draw_text(0,596,"oceanhandler active");
}

if(audio_is_playing(so_drill_underwater))
{
	draw_text(0,620,"playing drill underwater");
}

if(audio_is_playing(amb_ocean))
{
	draw_text(0,644,"playing amb_ocean");
}
draw_text(0,668,string(instance_number(obj_ow_mimic_spawner)));
draw_text(0,692,string(instance_number(obj_ow_mimc_snail_v3)));

//draw_text(0,716,"roomgotoComp: " + string(obj_save_boy.roomGotoComp));
//draw_text(0,740,"saveComp: " + string(obj_save_boy.saveComp));
//draw_text(0,764,"loadComp: " + string(obj_save_boy.loadComp));
//draw_text(0,788,"coordLoadComp: " + string(obj_save_boy.coordLoadComp));
//draw_text(0,812,"roomSwap: " + string(obj_save_boy.roomSwap));
//draw_text(0,836,"blockCLear: " + string(obj_save_boy.blockClear));

//draw_text(0,860,"tptrigx: " + string(obj_save_boy.TPTrigX));
//draw_text(0,884,"tptrigy: " + string(obj_save_boy.TPTrigY));

var _x = cos(target.angleDir*2*pi/360)*target.velocity;
var _y = sin(target.angleDir*2*pi/360)*target.velocity;


draw_text(0,908,"xvelo: " + string(_x));
draw_text(0,932,"yvelo: " + string(_y));


//draw_text(0,956,"disaplayActive: " + string(obj_save_boy.displayActive));
draw_text(0,980,"tankID: " + string(obj_ow_player_tank.id));
if(instance_exists(obj_ow_corrupt_tank))
{
	draw_text(0,1004,"ctank x: " + string(obj_ow_corrupt_tank.x));
	draw_text(0,1036,"ctank y: " + string(obj_ow_corrupt_tank.y));
}
//draw_text(0,1004,"ctank: " + string(instance_number(obj_ow_corrupt_tank)));
//also load triggers
//draw_text(0,716,"roomGotoComp: " + string(obj_save_boy.roomGotoComp));
}
}

if(keyboard_check_released(vk_f7))
{
	fpsDebug = !fpsDebug;
}

if(fpsDebug)
{
	draw_text(128,32,fps_real);
}

if(staticTimer = 30){staticTimer = 0;}
staticTimer += staticGain;
draw_sprite_ext(sp_tv_static,staticTimer,0,0,1,1,0,c_white,static_alpha);