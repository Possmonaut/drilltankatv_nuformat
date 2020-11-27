	var LID = layer_get_id("BG_Black");
	var BGID = layer_background_get_id(LID);
	layer_background_alpha(BGID,0);
	
	
	layer_set_visible("Tiles_1", false);