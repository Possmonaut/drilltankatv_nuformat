depth = 1;
myShadow.depth = 2;

depthSet = floor(point_distance(x + 16, y + 16, target.x + 16, target.y + 16) / 32);

depth = 1 + (10 * depthSet);
myShadow.depth = 2 + (10 * depthSet);
