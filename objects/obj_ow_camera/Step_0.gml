timer ++;
if(room = rm_setup || room=rm_deadth_screen || room = rm_victory_1)
{
	exit;
}

if(room != cRoom) //this tells us if we swapped rooms, so that we can run updates and such
{
	rSwap = true;
	cRoom = room;
	alarm[2] = 1;
	target = obj_ow_player_tank;
}

if(target.bombRTimer > 0)
{
	var tBRT = target.bombRTimer
	
	if(tBRT < 60)
	{
		chargeReady = 0;
		chargeEmpty = 1;
	}
	if(tBRT > 60 && tBRT < target.bombRTime)
	{
		chargeLoad = 1;
		chargeEmpty = 0;
	}
	if(tBRT > target.bombRTime -30)
	{
		chargeReady = 1;
		chargeLoad = 0;
	}
}

if(target.bombs = 0)
{
	chargeLoad = 0;
	chargeReady = 0;
	chargeEmpty = 1;
}

if((target.drillHeat >= 80 || target.HP <= 20) && target.override = false)
{
	oHeatTimer ++;
	if(oHeatTimer >= 30)
	{
		if(oHeat = false)
		{
			oHeat = true;
			var b = audio_play_sound(so_alarm,1,false);
			audio_sound_gain(b,0.05,0);
		}
		else
		{
			oHeat = false;
		}
		oHeatTimer = 0;
	}
}
else
{
	oHeatTimer = 0;
	oHeat = false;
}

