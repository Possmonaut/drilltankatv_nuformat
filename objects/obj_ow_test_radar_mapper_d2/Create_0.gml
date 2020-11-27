target = obj_ow_player_tank;

radarList = ds_list_create();
radarFadeList = ds_list_create();
radarFadePointStart = 1;
radarFadePointEnd = 1;

scanSpd = 2;

keypress = true;
radarComplete = true;

rotateDir = 0;

depth = -10;

deleteChain = false;
//todo:
//both ping and enemy blocks need to draw line to player and kill self if it's true
//kill if:
//can draw line to player
//no block exists under self
//or if block under self has been revealed
//for all block (especially enemy): if radar is active and radarDir is set 0 or close to 0, kill self 
//(doing the fade thing)
//or have radar store the angle variable and have the object kill itself slightly before the radar 
//reaches their variable
//set up glow functions


//things to fix:
//can still pass through enemies
//tank still too fast my dude

fadeActive = false;

endCellGen = 13; //basically the length of each of the update box' sides, centered on the player
startCellGen = (endCellGen +1) /2;

endCellClean = endCellGen + 2; //basically the length of each of the delete box' sides, centered on the player
startCellClean = (endCellClean +1) /2;
ImobCellClean = startCellClean * 32;

scanCheck = false;

squareX = 0;
squareY = 0;

alphaDecay = 0;
pingNum = 0;

eRad = 0;
circleSize = 4;
circleAlpha =  0;
circleAlphaGain = 4/256;