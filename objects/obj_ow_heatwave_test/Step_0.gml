 /*
 
 var pX =  x - camera_get_view_x(view_camera[0]);
 var pY =  y - camera_get_view_y(view_camera[0]);
 pX *= display_get_gui_width() / camera_get_view_width(view_camera[0])
 pY *= display_get_gui_height() / camera_get_view_height(view_camera[0])

haze_rect_add(pX,pY,32,32);


//offset test later
        var cl = camera_get_view_x(view_camera[0])
        var ct = camera_get_view_y(view_camera[0])
       
        var off_x = x - cl // x is the normal x position
        var off_y = y - ct // y is the normal y position
       
        // convert to gui
        var off_x_percent = off_x / camera_get_view_width(view_camera[0])
        var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
        var gui_x = off_x_percent * display_get_gui_width()
        var gui_y = off_y_percent * display_get_gui_height()
		*/
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

var XX = ((x - obj_ow_camera.x) * (gui_width / 1024))+gui_width/2;
var YY = ((y - obj_ow_camera.y) * (gui_height / 768))+gui_height/2;

if(hazeActive = false)
{
activeHaze = haze_rect_add(XX, YY, 32, 32);
hazeActive = true;
}
//note, don't do this. you can instead call the position changer script
haze_rect_delete(activeHaze);
activeHaze = haze_rect_add(XX, YY, 32, 32);



