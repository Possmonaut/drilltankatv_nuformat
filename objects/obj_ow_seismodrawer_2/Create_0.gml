//later you'll want to modify this to use a custom surface instead of the application surface 
//otherwise you'll have alt / tab bugs  


image_alpha = 0;
global.shadows = -1;
spriteAngle = 0;
spriteX = 0;
spriteY = 0;
depth = -20;
x = 0;
y = 0;


active = false;


//704, 64 top left
//864,704 bot right 
//srpt size 106, 640

sprite1X = 704;
sprite1Y = 64;

sprite2X = 704;
sprite2Y = 704;

sp_seismo_sprite1 = sp_seismo_sprite_1;
sp_seismo_sprite2 = sp_seismo_sprite_2;

newX = 0;
oldX = 80; 
activeSprite = 2;

depth = -3000;
timer = 0;
partTimer = 0;
magGain = 0;
slideSpeed = 10;
panelY = 0;
timerRand = 0;
magSpeed = 1;

magTarg = 0;

newBurst = false;