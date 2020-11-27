if(NPCID != 0 && activeConvo = true && stor_complete != true)
{
	target_line = NPC_dialogue[# NPCID, currentPage]; //this should set up the basics
	length = string_length(target_line);
	str_store = "";
	num = 0;
	
		for(var t = 1; t < length; t++) //start a for loop to store everything
		{
			str_store += string_char_at(target_line, t); 
			if(string_char_at(target_line, t+1) == "#")
			{ new_page_check += string_char_at(target_line, t+1);
				new_page_check += string_char_at(target_line, t+2);
				if(new_page_check = "#p")
				{
					page_array[num] = str_store;
					num ++;
					t +=2;
					str_store = "";
					new_page_check = "";
				}
			}
			else
			{
				if(t = length -1){
					str_store += string_char_at(target_line, t+1)
					page_array[num] = str_store;
					t ++;
					str_store = "";}	
			}
		}
	maxPages = num;
	str_store = "";
	currentPage ++;
	target_line = NPC_dialogue[# NPCID, currentPage];
	str_store += string_char_at(target_line, 0);
	if(str_store = "" || str_store != "#") //this checks if either the next line is blank, or just doesn't have a button
	{}
	else
	{
		//2. else, reset out tools, move onto the next line
		 //basically change the text crawl because buttons be active yo
		length = string_length(target_line);
		label_num = 0;
		options_num = 0;
		str_store =""; //removes # from the string
		//3. for loop out the buttons
		
		//>>>here is where we need to run that if / else series to check for things. if the next value is just a letter, then we run the below as 
			//normal. you can set that up pretty easily to make sure things are working correctly
			//so this is the beginning of the if / else array. check for each type, then run the appropriate script
			
		if(string_char_at(target_line, 2) = "=") //check if var is true or false
		{
		//this first one we wanna call a script that checks if thing is true. it will parse the line and load in the appropriate data
		//including the line
		//the buttons to load depending on if thing is true or not true
		//store line after char 4 into the read to screen part
		//set the next line to be whatever
		//reset the parser data
		//load in next line when player presses enter as usual
	//	scr_dialogue_bool_check();
		}
		else if (string_char_at(target_line, 2) = "@")
		{
	//		scr_dialogue_give_item();
		}
		else
		{
			for(var l = 2; l < length; l++) //storing loop, and because l has to be 2 for some fuckign reason
			{
				//4. read the line until we reach a #, then store the value in the # into the button, then repeat until all buttons are stored
				if(string_char_at(target_line, l) != "#")//if next value is not a #
				{
				str_store += string_char_at(target_line, l);//read line, store line
				}
				else
				{
					button_labels[label_num] = str_store; //store label
					label_num++; //for looping
					str_store = ""; //reset storage string
					l ++; //skip over the #
					str_store = string_char_at(target_line, l); // this should store the number
					button_optionID[options_num] = str_store; //store that number in as the optionsID for the label (note, you could probably use a single array for this instead of two seperate ones)
					str_store = "";
					options_num++;
					l ++;
				}		
			}
			buttonsActive = true;
		}
	}
	currentPage = 0; 
	stor_complete = true;
}

if(buttonsActive = true && buttonsOut != true && charCount >= string_length(page_array[currentPage]))
{	
	buttonMax = array_length_1d(button_labels);
	for(var u = 0; u < buttonMax; u ++){
		var inst = instance_create_depth(200 + u*150, 700, -50, dialogue_button);
			inst.optionID = obj_dialogue_controller_2.button_optionID[u];
			inst.label = obj_dialogue_controller_2.button_labels[u];
			active_buttons[u] = inst;
	}
	buttonsOut = true;
	active_buttons[0].active = true; //this sets the first button to always be auto-selected so that players can just mash space
}

if(activeConvo = true){
	keypressTimer ++;
	
	if(buttonsOut = true) //this block lets you select whatever buttons are in game ATM, as long as there are active buttons
	{
		if(keyboard_check_released(vk_right))
		{
			active_buttons[buttonShift].active = false;
			buttonShift += 1;
			if(buttonShift < 0){buttonShift = 0}
			if(buttonShift > buttonMax-1){buttonShift = buttonMax-1}
			active_buttons[buttonShift].active = true;
		}
		if(keyboard_check_released(vk_left))
		{
			active_buttons[buttonShift].active = false;
			buttonShift -=1;
			if(buttonShift < 0){buttonShift = 0}
			if(buttonShift > buttonMax-1){buttonShift = buttonMax-1}
			active_buttons[buttonShift].active = true;
		}
	}

	if(keyboard_check_released(vk_space) && keypressTimer >= 10 && charCount >= string_length(page_array[currentPage]) && currentPage >= maxPages){
		if (buttonsActive != true)
		{
			if (fork = true)
			{
				keypressTimer = 0;
				NPCIDGet = false;
				charCount = 0;
				maxPages = 0;
				stor_complete = false;
				currentPage = optionID;
				fork = false;
			}
			else
			{
			activeConvo = false;
			NPCID = 0;
			keypressTimer = 0;
			NPCIDGet = false;
			charCount = 0;
			currentPage = 0;
			maxPages = 0;
			stor_complete = false;
			}
		}
		else
		{
		keypressTimer = 0;
		NPCIDGet = false;
		charCount = 0;
		currentPage = 0;
		maxPages = 0;
		stor_complete = false;
		buttonsOut = false;
		buttonsActive = false;
		currentPage = active_buttons[buttonShift].optionID;
		currentPage = real(currentPage);
		instance_destroy(dialogue_button);
		return;
		}
		
	}

		if(charCount >= string_length(page_array[currentPage])&& keypressTimer >= 10 && keyboard_check_released(vk_space) && buttonsActive != true )
	{
		charCount = 0;
		currentPage ++;
		keypressTimer = 0;
	}
		if(keyboard_check_released(vk_space) && keypressTimer >=10){
			charCount = string_length(page_array[currentPage])
			keypressTimer = 0;	
		}
}

//i'm not sure why these are here but if you get any weird off set bugs, this might be it
//x = obj_ow_PC2.x;
//y = obj_ow_PC2.y;