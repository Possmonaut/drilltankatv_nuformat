function scr_load_jSON_from_file(argument0) {
	var _filename = argument0;

	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);

	buffer_delete(_buffer);

	var _jSON = json_decode(_string);

	return _jSON;



}
