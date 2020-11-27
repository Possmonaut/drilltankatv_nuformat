//todo
/*
fix urnign animation; needs to not move when cDur not within X of pd, obv, but for the arm / tail rotation
potentially just have it update direction but not the hand position so the hand stays aloft while turning
it won't drag itself around, but it won't disjoint either 
add tail "slimtrail" animation
fix arm snapping when emerging (needs to just stay at point or move back to middle)
fix arm snapping when burying (I'm assuming you will want to just have a thing go "if current endX not = newendx, shift)
add particle effects
update visual sprites (tail should be longer + thinner, hand should be larger, eyes should wave more, body needs outlines)
spawner + spawner behavior

increase swipe size; add two more collision lines, one further out nad one closer to body
*/

image_alpha = 0;
progen = 0;

activated = false;
fadeVal = 0.85;
forceActivate = false;

angleDir = 0;

timer = 0; 
updateTimer = 0;
updateInterval = 60;

eatTimer = 0;
eatInterval = 0;

strikeTimer = 0;
windUpTimer = 60;
strikeInterval = 180;

chaseTimer = 600;
chaseTimerInterval = 600;

target = obj_ow_player_tank;

myPath = path_add();
path_set_kind(myPath, 1); //sets path, 0 for straight 1 for smooth

mySpeed = 0.75;

visualSp = instance_create_depth(x,y,depth-1,obj_ow_generic);

//visualSp.image_alpha = 0;

activeDraw = 1;

state = 0;

damageTrigger = false;
chrgeSpd = 2.5;
chrgeBase = 2.5;

detectRange = 40;
rammingDistance = 40;

//used by player_tank
HP = 210;
drillable = true;
collision = true
dsTrig = false;
deathSpawn = -4;
tsTrig = false;
tileSpawn = -4;

atkdist = 32;

stepTrigger = true;
stepAlterantor = false;

death = false;
death2 = false;
dTimer = 0;
dTime = 120;

armType = 1; //1 = left, -1 = right

endpointX = x;
endpointY = y;

handPointX = x;
handPointY = y;

centerPointX = 0;
centerPointY = 0; 

midjointX = 0;
midjointY = 0;

midLength = 0;

armLength = 0;
halfLength = 0;

centerDirX = 0;
centerDirY = 0;

jointLength = 64; //should be 128, make sure you reset this 

restingPointX = x-64;
restingPointY = y-64;

targX = 0;
targY = 0;

posLockX = false;
posLockY = false;

armDirBase = 0;
armDirMid = 0;

waitTimer = 0;

emerged = false;
fullEmerge = false;

//arm controlling variables
armTimer = 0;
stpTimer = 60;

lArmX = 0;
lArmY = 0;

armSpd = 3.5;
armStp = true;

rUpdate = true;

reachLength = 24;
reachStor = 24;

cDur = 0;
durSpd = 0.5;

var targX = x+lengthdir_x(reachLength,cDur);
var targY = y+lengthdir_y(reachLength,cDur);
armPnt1X = targX;
armPnt1Y = targY;

//for attacking
swipeTimer = 0;
swipeTime = 60;
swipeSpd = 1;
swipedSpd = 4;
pullBack = false;

//for animation state control
animTimer = 0;
circleSize = 0;
circleAlpha = 1;

pullT = false;
armScale = 0.5;
animInterval = 0;
animTimer = 0;

buttScale = 0;

startX = x;
startY = y;

comeBack = false;

circRotation = false;

myAudM = 0; //drag
myAudE = 0; //emerge
myAudI = audio_play_sound(so_grinder_chase,1,true);
audio_sound_gain(myAudI,0.1,0);
audio_sound_pitch(myAudI,0.2)

deathAudio = so_meat_break;
drillAudio = so_drill_inmeat;