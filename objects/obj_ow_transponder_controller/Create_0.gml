//read data fed to it to the player 
//store previous transponder logs to peruse 
//sort transponder logs into two groups based on a identifier:
//important, and non-important 
//have a toggle that just hides all non-important notes
//just gonna crib the dialogue handler from biologue and insert a "important"
//tag

//this is the prototype using the new dialogue code system

activeConvo = false; //this is if you're in a conversation. if true, most controls are locked out
NPCID = 0; //this is who you're talking to
NPCIDGet = false; //this lets the parser know when it's got maxPages set
gridMax = 99;

//debug variables
thing = false; //this is a test variable. set to false to test the scr_dialogue_give_item
debug_var = "";
debug_var2 = "";

//printing control variables
keypressTimer = 0;
textPart = "";
charCount = 0;
maxPages =  0; //once currentPage reaches maxPage, the dialogue box will be shut
currentPage = 0;

//variables to store parsing data
target_line = 0; 
length = 0;
str_store = "";
num = 0;
stor_complete = false;
new_page_check = "";

//controls the spawning of buttons
buttonsActive = false;
buttonMax = 0;

//these are used for the various operation scripts
fork = false;
optionID = 0; //this will load the next page as determines by the if/ else check if fork is active

// \n is new line
// #p is new page
// # denotes a dialogue button #x denotes the option to load if that dialogue button is selected
	// so #I like big butts#2
// #= runs a boolean check
// #@xxxvariable will add the value of xxx to the variable 
	
page_array[0] = ""; //parses dialogue out from below and writes it out page by page
button_labels[0] = ""; //labels to be written to dialogue buttons from script
button_optionID[0] = 0; //once button is presses, it will plus it's stored option into the below dialogue tree
buttonsOut = false;
active_buttons[0] = "";
buttonShift = 0;


NPC_dialogue = ds_grid_create(gridMax,gridMax);
ds_grid_add(NPC_dialogue, 0, 0, "Ah. \nThere he is. \nthat motherfucker. \nwhat a tool.");
ds_grid_add(NPC_dialogue, 1, 0, "Ah. \nThere he is. \nthat motherfucker. \nwhat a tool.");
NPC_dialogue[# 2, 0] = "Did you know that world-renowned \nwriter Stephen King was once hit by a car? #pJust something to consider.";
NPC_dialogue[# 2, 1] = "Just something to consider.";
NPC_dialogue[# 3, 0] = "Will you take the red pill, \nor the blue pill?";
NPC_dialogue[# 3, 1] = "#Red#2#Blue#3";
NPC_dialogue[# 3, 2] = "That's just a shitty meme you know.";
NPC_dialogue[# 3, 3] = "And in the end, Neo got to enjoy a \nnice steak and nothing bad happened.";
NPC_dialogue[# 4, 0] = "Didja get the thing I sent yah?";
NPC_dialogue[# 4, 1] = "#=thing#2#3";//check var thing. if true load dialogue 2 if false load dialogue 3
NPC_dialogue[# 4, 2] = "Yes? Niiiiiiice";
NPC_dialogue[# 4, 3] = "No? Okay hold on lemme send it again.";
NPC_dialogue[# 4, 4] = "#@001thing"; //this will give the player 1 of var thing then end the conversation, I think


if(room = rm_init) {obj_init_check.init += 1;}
