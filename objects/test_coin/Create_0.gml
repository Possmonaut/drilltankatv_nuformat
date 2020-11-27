gold = 0;
burntimer = 0;
stop = false;
switch1 = false;
timer = 0;
targetX = x - irandom_range(-500, 100); //x - irandom_range(500, 700);
targetY = irandom_range(1000, 1100); //891;


ax = x; // Starting position for the arc.
ay = y;

bx = (targetX)/2; // Middle of the arc.
by = (targetY)/2 - irandom_range(100, 1500); //-256; // Up 256 pixels to create an arc.

cx = targetX; // End position of the arc.
cy = targetY;

gravDecay = 0.1;
byDecay = 20;
