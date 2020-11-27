//note: you'll need a message rolodex to store the values of incoming messages, then click them off as 
//they're posted
if(instance_number(obj_ow_camera) > 1)
{
	instance_destroy();
	exit;
}

image_alpha = 0;
depth = -2;

//offsets for positioning
drawX = 1156;
drawY = 90; 
offSet = 8;

boxSizeExpandedW = 356;
boxSizeExpandedH = 712;
boxSizeMinH = 32;

boxSizeW = 356;
boxSizeH = boxSizeMinH;



//max line length 
maxlineLeng = 512;

//vertical line spacing 
lineSpacing = 18;

//number of lines on the screen at once. each line is about 15 pixels in height
displayLines = 39; 

//where the lines start drawing. needsto be adjusted if you change the above
drawPoint = 95; 

//are we actively reading a line
readLine = false;
//which line
lineSelect = 0; 
//who is posting said line
msgName = "Flightcheck";

//are we writing a line to the screen
newEncode = false;

//list for line spacing
printList = ds_list_create();
//list being printed to the screen
displayList = ds_list_create();
for(var i = 0; i < displayLines; i ++)
{
	displayList[|i] = "";
}

//ds_add_list to this list to spool up multiple messages instead of sending directly
msgSpooler = ds_list_create();
nameSpooler = ds_list_create();

//used for typing effect
charCount = 0;
typeSpeed = 0.5; //note: only 1 or less, and should be whole vars
textPart = "";

//signal to other things that this is no longer readingg / writing 
readComplete = true;

//library of lines (note: position 0 is meant to be overwritten)
lineList = ds_list_create();
lineList[|0] = "if there were two dudes on the moon and one killed the other with a rock would that be fucked up or what"
lineList[|1] = "a ton of lead is heavier than a ton of feathers"

debug0 = 0;

keyClose = false;

alarm[0] = 60;

blink = true;
newMsg = false;

wobbleTimer = 0;