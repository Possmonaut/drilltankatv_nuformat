function scr_distMult(argument0) {
	var target = argument0; 

	var pointDist = point_distance(x, y, target.x + 15, target.y + 15);
			
			if(pointDist<= 96) // =2
			{
			target.image_alpha = 1;
			target.downObj.image_alpha = 1;
			target.upObj.image_alpha = 1;
			target.distMultC = 0.25;
			target.downObj.distMultC = 0.25;
			target.upObj.distMultC = 0.25;
			}
			
			if(pointDist <= 64) // =1
			{
				target.image_alpha = 1;
			target.downObj.image_alpha = 1;
			target.upObj.image_alpha = 1;
			target.distMultC = 0.5;
			target.downObj.distMultC = 0.5;
			target.upObj.distMultC = 0.5;
			}
		
			if(pointDist > 96) // =3
			{
				target.image_alpha = 1;
			target.downObj.image_alpha = 1;
			target.upObj.image_alpha = 1;
			target.distMultC = 0.0;
			target.downObj.distMultC = 0.0;
			target.upObj.distMultC = 0.0;
			}


}
