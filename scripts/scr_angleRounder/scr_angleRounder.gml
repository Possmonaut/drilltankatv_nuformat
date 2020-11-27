function scr_angleRounder(argument0) {
	//rounds direction angles to cardinal directions
	var rotation = argument0;

	if(rotation > 45 && rotation < 135){return 90;} //up
	if(rotation > 225 && rotation < 315){return 270;} //down
	if(rotation > 315 || rotation < 45){return 0;} //right
	if(rotation > 135 && rotation < 225){return 180;} //left








	/*
	if(rotation > 45 && rotation < 135){ vibFrame = 12; image_angle = rotation - 90;} //up 6/7
		if(rotation > 225 && rotation < 315){ vibFrame = 8; image_angle = rotation + 90;} //down 4/5
		if(rotation > 315 || rotation < 45){ vibFrame = 4; image_angle = rotation;} //right 2/3
		if(rotation > 135 && rotation < 225){ vibFrame = 0; image_angle = rotation - 180;} //left 0/1

/* end scr_angleRounder */
}
