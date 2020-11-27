endCellGen = 31; //basically the length of each of the update box' sides, centered on the player
startCellGen = (endCellGen+1) /2;

endCellClean = endCellGen + 2; //basically the length of each of the delete box' sides, centered on the player
startCellClean = (endCellClean+1) /2;
ImobCellClean = startCellClean * 32;

pointCheck = ds_list_create();
pointList = ds_list_create();
//pointListX = ds_list_create();
//pointListY = ds_list_create();
//pointAngle = ds_list_create();

pointListXYAng = ds_grid_create(3,((endCellGen+1) * 4) + 4);

//needs to check past points for collisions with walls. Which means after gathering all points, 
//or DURING gathering all points, needs to raycast until hitting a wall then store that X/Y as a point
//which also means WALLS need to bed OBJECTS 

//so raycast to all four points
//if raycast collides
//figure out which side we're colliding with
//use the associated x / y 
//plug into pythag algorithm (we'll need to make a unique one for each side with slightly swapped around x/y values) 
//point becomes that end x/y 
//else
//point becomes point that extends past point using lengthdir_

