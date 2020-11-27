//post demo:
//instead of timer, set arm swapping based on distance to central body. once x distance, swap arms
//change monster to only move forwards when active arm is stionary (pulling)

progen = 0;

xOfst = sprite_width * 0.5;
yOfst = sprite_height * 0.5;

mDir = 0;
mMove = false;

pointcX = 0;
pointcY = 0;
nPoint = false;
spd = 1;
cDur = 0;
durSpd = 2;

timer = 0;

armStp = true;

stpTimer = 60;
fStp = 20;
tStp = 10;

armSpd = 3;

reachLength = 24;

var targX = x+lengthdir_x(reachLength,cDur+32);
var targY = y+lengthdir_y(reachLength,cDur+32);
armPnt1X = targX;
armPnt1Y = targY;

targX = x+lengthdir_x(reachLength,cDur-32);
targY = y+lengthdir_y(reachLength,cDur-32);
armPnt2X = targX;
armPnt2Y = targY;

lArm = instance_create_depth(x,y,depth+1,obj_ow_grinder_arms);
lArm.progen = id;
lArm.jointLength = reachLength;
rArm = instance_create_depth(x,y,depth+1,obj_ow_grinder_arms);
rArm.progen = id;
rArm.armType = 1;
rArm.jointLength = reachLength;

lArmX = 0;
lArmY = 0;
rArmX = 0;
rArmY = 0;

rUpdate = true;

clam = 60;

segArray = ds_list_create();
segArray[0] = id;

myBod = sp_grinder_body;
atkIndex = 0;

for(var i = 1; i < 6; i ++)
{
	segArray[i] = instance_create_depth(x,y,depth+1,obj_ow_generic);
	if(i=1){segArray[i].sprite_index = sp_grinder_tail0; }
	if(i=2){segArray[i].sprite_index = sp_grinder_tail1; }
	if(i=3){segArray[i].sprite_index = sp_grinder_tail2; }
	if(i=4){segArray[i].sprite_index = sp_grinder_tail3; }
}

death = false;