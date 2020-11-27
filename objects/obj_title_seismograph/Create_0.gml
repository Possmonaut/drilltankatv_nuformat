//create grid 
//set point at end of grid to 1 according to sinewave thingy
//check every point in grid and if 1, move it forward by 1 grid square (-x)
//repeat 
//if at end, instead of - 1X, set to 0

//for seismograph effect
//gain magnitude
//go up to a certain point based on max magnitude
//once hit that max, reverse direction, lose magnitude
//repeat until magnitude is 0 again
draw_set_font(pixelette16);


depth = -90;

title_offsetW = 448;
title_offsetH = 156;

startNewGame = false;
magnitude = 8;
magDecay = 0.1;
magCap = 0;
medianPoint = y;
timer = 0;
rando = 0;

magAdd = 80; //starting in the middle

//set up top right of rectangle to be x,y, to basically be x,y of the object -640, -160
//seismoGrid = ds_grid_create(1024, 768); // median = half of y basically
lastpointX = 0; //used for creating line connections
lastpointY = 0;

//varOpeningTextCrawl = "You were hired by Place & Holder LLC to drill for oil deep\n beneath the surface of the ocean.\n For this task you were trained to pilot a subterene;\n A massive machine plated in solid steel, weilding a \n superheated drill to bore through bedrock.\n Fearlessly locked away, you dug deep. \n The caverns shook as somewhere, the bowels of the earth shifted.\n A cave in had rendered the cargo shaft impassable, \n flooded with super heated stone.\n One by one the rest of the crew has disappeared.\n The depot is deserted.\n Your radio is silent.\n The only way out is to find a air pocket and \n hope it leads you back to the surface.";
varOpeningTextCrawl = " Signals from deep earth mining base Theta have been offline for 48 consecutive hours after initial tremor. \n The cause of the geological disturbance is unknown, but seismograph readings\n have returned to normal, so we are sending you in to survey the damage.\n We believe the entire base is unsalvageable, but as HR mandates, \n we require survey information to file a full report.\n  \n We need you to download transmission data from black boxes and any equipment that might have been left behind \n and see if you can piece together what happened. \n The base itself is located under the floor of the Atlantic Ocean, nearly a mile down,\n within an ancient flooded cave system. This system has remained undisturbed and isolated for many millenia, \n making it one of the last places we can acquire those minerals we have long since lost on the surface. \n \n Due to the environment, we're sending you down in a Mark 19 Copepod class subterrene to help you cut \n any bedrock that might have collapsed into the tunnels. \n It's not big, but the nuclear engine should sustain you for as long as the mission requires. \n We'll be sending you down shortly. \n No signal can make it through nearly a mile of bedrock \n and the only hardwired connection to the surface was severed in the quake. \n So once you're at the bottom it will be radio silence from here on out.\n \n \n Good luck. "

varPressSpace = "press space"
myAlpha = 1;
keyHoldTimer = 0;
fading = false;
spaceCheeck = false;
charCount = 0;
blinkyCursor = "_";
blinkyTimer = 0;

activeConvo = false;
stor_complete = false;

escHold = false;
escHoldTimer = 0;
loadTrig = false;

nRoomLoad = true;

fade = obj_ow_fade_handler;

//instance_create_depth(512, 512,-200, obj_ow_seismodrawer);

init = false;
loadOp = true;
keypress = false;

audio_group_set_gain(soundEffects,0,0);

openTheme = audio_play_sound(amb_opening_theme,1,true);
audio_sound_gain(openTheme, 0,0);
alarm[0] = 240;

loadTrig = false;

seisDrawY = 0;
seisDrawYMax = 640;

titleSprite = true;

buttonFlash = 0;
buttonActive = true;

pause = 0;