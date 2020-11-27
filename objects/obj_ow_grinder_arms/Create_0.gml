progen = 0;

armType = -1; //1 = left, -1 = right

endpointX = 0;
endpointY = 0;

centerPointX = 0;
centerPointY = 0; 

midjointX = 0;
midjointY = 0;

midLength = 0;

armLength = 0;
halfLength = 0;

centerDirX = 0;
centerDirY = 0;

jointLength = 0; //should be 128, make sure you reset this 

restingPointX = x- 64;
restingPointY = y - 64;

targX = 0;
targY = 0;

posLockX = false;
posLockY = false;

armDirBase = 0;
armDirMid = 0;

waitTimer = 0;

keySpace = false;
armSpeed = 0.25;
deploySpeed = 0.02;
activeSpeed = 0.2;

targetPoint = 0; //0 = arm no longer active, then have the below choose points as targetPoint - 1;
targetList = ds_grid_create(5,5);
targetList[# 0,0] = x - 48;
targetList[# 0,1] = y;
targetList[# 1,0] = x - 16;
targetList[# 1,1] = y;
targetList[# 2,0] = x - 16;
targetList[# 2,1] = y - 32;
targetList[# 3,0] = x - 48;
targetList[# 3,1] = y - 32;