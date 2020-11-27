//if Tactive, increase size to point, else, decrease size to point
//if point, show text, else, do not show text (or potentially fade text)
//draw_text_color will let you set the text alpha 

var _x = camera_get_view_x(view);
var _y = camera_get_view_y(view);


if(instance_exists(obj_ow_tutorial_controller))
{
	if(obj_ow_tutorial_controller.fadeDone = false)
	{
		//exit;
	}
}

if(keyClose)
{
	if(boxSizeH > boxSizeMinH)
	{
		boxSizeH -= 8;
	}
}
else
{
	if(boxSizeH < boxSizeExpandedH)
	{
		boxSizeH += 8;
	}
}


draw_set_color(c_black);
draw_rectangle(_x+drawX,_y+drawY,_x+drawX+boxSizeW,_y+drawY+boxSizeH,false);
draw_set_color(c_white);
draw_rectangle(_x+drawX,_y+drawY,_x+drawX+boxSizeW,_y+drawY+boxSizeH,true);

if(boxSizeH >= boxSizeExpandedH)
{
	draw_set_font(pixelette14);
	for(var p = 0; p < displayLines; p ++)
	{
		//draw_text(drawX,drawY + (lineSpacing * p),p);
		if(displayList[|p] != undefined)
		{
		draw_text(_x+drawX+offSet, _y+ (lineSpacing * p) + drawPoint,displayList[|p]);
		}
	}
	/*
	for(var l = 0; l < ds_list_size(printList); l ++)
	{
		draw_text(drawX+256, drawY + (lineSpacing * l),printList[|l]);
	}
	*/
	draw_set_font(pixelette16);
}

//draw_text(512, 0, debug0);


//will need to erase oldest line in displayList, then add in newest to keep it the same 9 lines long

//will need to parse each message into a line in the line list and draw each line as such 

//you'll need to parse a thing so that if the below hits a new line, it will
//bump up everything below it and draw new stuff 

//so monitor the string length using string_length_ext
//you'll need to measure out the length of each word, just a note, before adding them 
//once it reaches whatever, bump up it's draw, then move to writing in the next list slot
//if a new transpondence comes in, bump everything up by 1 blank line 

//if new line detected
//so write each line into the transponder box one character at a time 
//if reaching the end of a line, and the next line isn't blank. transcribe that entire line into the box above
	//so store each line in temp var then move up by one 
//then, if next line = "", newLine = false. no more parsing, just draw the lines below
//then, draw eveything in every line of the list
//we'll also need to draw a blank line before we do all this 
//only write the first line, then when done, delete it. 
//do this until the list = 0; this will let things get stored up 

//write line
//if hit end of line, bump everything up
//delete that line 
//either incirment, or just see if said line becomes the new 0
//begin write new line


//reminder, the data in displayList will need to be put in backwards 
// 27 / 256

if(keyClose && newMsg = true){
	
	if(blink)
	{
	draw_text(_x+drawX, _y+drawY, ">>T<<");
	}
	
	wobbleTimer += 3;
	var wobSize = -3;
	
	var wobble = (wobSize*dsin(wobbleTimer));
	
	var CXOFST = 29;
	var CYOFST = 12;
	
	//draw_sprite_ext(sp_location_indicator,0,(x1 + xCenter)/ xSizeMult, (y1 + yCenter + wobble)/ xSizeMult,xSizeMult,xSizeMult,0,c_white,1);
	draw_circle_color(_x+drawX+CXOFST, _y+drawY+CYOFST,16+wobble,c_white,c_white,true);
	draw_circle_color(_x+drawX+CXOFST, _y+drawY+CYOFST,17+wobble,c_white,c_white,true);
	draw_circle_color(_x+drawX+CXOFST, _y+drawY+CYOFST,18+wobble,c_black,c_black,true);
	//add a sine to the above so it hovers up and down 
	}