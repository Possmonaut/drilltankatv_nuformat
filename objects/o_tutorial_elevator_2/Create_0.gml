/*
light effect: 
have awited out version of the elevator that can be cast onto the elevator when passing by a "light source" until 
it is passed, losing alpha as it goes by 

better idea: use solid circles, have them, offset slightly with each one genned, have a solid light from the barge,
have it lerp to the x and y of the circle currently coming up so they meet

and if you can draw lines from the circle vertices, even better 

better yet, do vertice pairs, and manually draw the circle. you'll basically need 3 circles, the one at the bottom,
the one heading to the top, and the one that mimics the offset of the one at the top


just draw the ciclres for now, and figure out how to do the vertice offsets later. you'll basically need
to store sets of vertice data based on lengthdir based on circle size, probably at 16 coordinates
*/

ringTime = 1; //set number of seconds per ring here 
ringTime *= 60;

iSpd = image_number/ringTime;

/*
rSpd = 1/ringTime;
wallRing = instance_create_depth(x+(sprite_width*0.5),y+(sprite_height*0.5),depth+1,obj_ow_generic);
wallRing.sprite_index = sp_test_TD_wall_ring;
wallRing2 = instance_create_depth(x+(sprite_width*0.5),y+(sprite_height*0.5),depth+1,obj_ow_generic);
wallRing2.sprite_index = sp_test_TD_wall_ring;
wallRing2.image_xscale = 0;
wallRing2.image_yscale = 0;

ringList = ds_list_create();
ringList[|0] = sp_test_TD_wall_ring;
ringList[|1] = sp_test_TD_wall_ring1;
ringList[|2] = sp_test_TD_wall_ring_light;

leadRing = ds_list_create();
leadRing[|0] = wallRing;
leadRing[|1] = wallRing2;
*/

target = obj_ow_player_tank;

shakeTimer = 0;
shakeInterval = 240;

ringTimer = 0;
ringPass = false;
ringInd = 0;
brightAlpha = 0;
lightTrigger = false;
lightTime = ringTime * 3;
lightTimer = 0;


xOfst = 0;
yOfst = 0;

botCircle = ds_grid_create(18,2);
midCircle = ds_grid_create(18,2);
topCircle = ds_grid_create(18,2);



bRad = 96;
mRad = 384;
tRad = 512;
aRad = bRad;

mX = x+xOfst;
mY = y+yOfst;

aX = x+xOfst;
aY = y+yOfst;

bmDist = 0;
mtDist = 0;

spd = 20;

inc = 0;

descendAnim = false;
fade = obj_ow_fade_handler;

x = x+(173*32);

base = instance_create_depth(x,y,depth+1,obj_ow_elevator_bottom);

//base.sprite_index = sp_test_TD_elevator_center;
struts = instance_create_depth(x,y,depth+1,obj_ow_generic); //101
struts.sprite_index = sp_test_TD_elevator_struts;

engines = instance_create_depth(x,y,depth-2,obj_ow_generic); // 102
engines.sprite_index = sp_test_TD_elevator_legacy_engine;
bigassBG = instance_create_depth(x,y,depth+2,obj_ow_generic);
bigassBG.sprite_index = sp_bigassBlackBG;



depth = -1;

onBoard = false;

enginIntGain = (image_speed / 60)*6;
engineInt = 0;

tunnelTime = 60;
tunnelTimer = 0;

//activeTunnel = instance_create_depth(x,y,depth+1,obj_ow_tunnel_ring);

tunnelList = ds_list_create();

for(var i=0; i<3; i++)
{
	var b = instance_create_depth(x,y,depth+1,obj_ow_tunnel_ring);
	ds_list_add(tunnelList, b);
}