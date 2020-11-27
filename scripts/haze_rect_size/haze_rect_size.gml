/// @description  haze_rect_size(id, w, h);
/// @function  haze_rect_size
/// @param id
/// @param  w
/// @param  h
function haze_rect_size(argument0, argument1, argument2) {
	//Started?
	if (!instance_exists(obj_hazeC)){
	    show_error("Haze not started. Use haze_start()", false);
	    return 0;
	}

	//Change
	var arr = obj_hazeC.hazeAreas[| argument0];

	var newArr;
	newArr[0] = arr[0];
	newArr[1] = arr[1];
	newArr[2] = argument1;
	newArr[3] = argument2;

	obj_hazeC.hazeAreas[| argument0] = newArr;



}
