/*

idealWidth = 1920
idealHeight = 1080;
aspectRatio = display_get_width() / display_get_height();

idealHeight = round(idealWidth/aspectRatio);
//iWidth = raound(iHeight*aspectRatio);

if(idealHeight & 1){idealHeight ++;} //bitwise operator &

for(var i = 0; i < room_last; i ++)
{
	
	if(room_exists(i))
	{
		room_set_viewport(i,0,true,0,0,idealWidth,idealHeight);
		room_set_view_enabled(i,true);
	}
}

surface_resize(application_surface,idealWidth,idealHeight);
window_set_size(idealWidth,idealHeight);

alarm[0] = 1;

*/
idealWidth = 1920;
idealHeight = 1080;
aspectRatio = display_get_width() / display_get_height();
//idealWidth = round(idealHeight * aspectRatio);

if(idealWidth & 1){idealWidth ++;} //bitwise operator &

for(var i = 0; i < room_last; i ++)
{
	
	if(room_exists(i))
	{
		room_set_viewport(i,0,true,0,0,idealWidth,idealHeight);
		room_set_view_enabled(i,true);
	}
}

surface_resize(application_surface,idealWidth,idealHeight);
window_set_size(idealWidth,idealHeight);

alarm[0] = 1;

turnOffBG = true;

cRoom = 0