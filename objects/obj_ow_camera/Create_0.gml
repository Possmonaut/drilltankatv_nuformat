///@ original name is o_camera
// You can write your code in this editor

if(instance_number(obj_ow_camera) > 1)
{
	instance_destroy();
	exit;
}

timer = 0;

fScreenCheck = false;

//view_width = 1920;
//view_height = 1080;

iWidth = o_display_manager.idealWidth;
iHeight = o_display_manager.idealHeight;

view_width = o_display_manager.idealWidth;
view_height = o_display_manager.idealHeight;

target = obj_ow_player_tank;

window_scale = 1;

window_set_size(view_width*window_scale,view_height*window_scale);

alarm[0] = 1;
alarm[1] = 20;

surface_resize(application_surface,view_width*window_scale,view_height*window_scale);
needleRotat = 0;

heat = 0;
fathoms = 1000;
HP = 100;
RPM = 0;
charges = 010;
dosh = 0;
ore = 0;
varUp = 0;

oHeat = false;
oHeatTimer = 0;

ventAlert = false;
ventTimer = 0;

loadTimer = 0;

chargeEmpty = 0;
chargeLoad = 0;
chargeReady = 1;

myDir = 0;

shakeForceDecay = 0.05; //how rapidly shake force goes back to 1 after being triggered

shake = false;
shakeForce = 0.5;
shakeDur = 5;

pair0X = 0;
pair0Y = 0;

pair1X = 0;
pair1Y = 0;

guiShakeX = 0;
guiShakeY = 0;

//-------- gui END

escKey = false;
panelOpen = false;

escTabX = 448;
escTabX2 = 576;
escTabY = 736;
escTabY2 = 768;

escTab_W = 128;
escTab_H = 32;

slideSpeed = 25;

escKeyHold = false;
escKeyTimer = 0;

esc_menuW = 1920 - 2;
esc_menuH = 1080;
escTabOffset = (esc_menuW / 2) - 64;

panelY = esc_menuH;

panelMaxY = (esc_menuH / 2)

centerShake = false;

locHP = 0;
locRPM = 0;
locKPH = 0;

HPAccel = 0;
rpmAccel = 0;
KPHAccel = 0;

accVar = 0.01;

currHP = 100;
debugY = 0;

sTrig = true;
resoSwitch = true;

var xx = display_get_width();
var yy = display_get_height();

window_set_size(xx,yy);

camera_set_view_size(view,iWidth,iHeight);

display_set_gui_size(camera_get_view_width(view),camera_get_view_height(view));

cRoom = rm_new_demo;
rSwap = false;

image_alpha = 0;

stopFollow = false;

jamTimer = 0;
jamTime = 30;
jamFlash = true;

staticTimer = 0;
staticTime = 120 + irandom(600);

fathomLink = 0;

//doodads
saveAlpha = 0;
volAlpha = 0;
volGain = false;
radarPosGain = -1;
radarPos = 0;

dotTimer = 0;

debugToggle = false;