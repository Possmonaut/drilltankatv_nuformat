/*

//circle
gpu_set_blendmode(bm_add);

for(var i=0; i<ds_list_size(hazePoints); i++){
    //get array
    var Arr = hazePoints[|i];
    
    //translate to surface coords
    var sX, sY, sR;
    sX = Arr[0] - (cam_x*cameraUsed);
    sY = Arr[1] - (cam_y*cameraUsed);
    sR = Arr[2];
    
    //subtract app coord
    //sX -= pos[0]/2;
    //sY -= pos[1]/2;
    
    //scale
    if (cameraUsed){
        sX *= surfW/cam_w;
        sY *= surfH/cam_h;
        sR *= surfW/cam_w;
    }
    else{
        sX *= surfW/room_width;
        sY *= surfH/room_height;
        sR *= surfW/room_width;
    }
    
    //draw
    draw_circle_colour(sX, sY, sR, c_white, c_black, false);
}

//rect
for(var i=0; i<ds_list_size(hazeAreas); i++){
    //get array
    var Arr = hazeAreas[|i];
    
    //translate to surface coords
    var sX, sY, sW, sH;
    sX = Arr[0] - (cam_x*cameraUsed);
    sY = Arr[1] - (cam_y*cameraUsed);
    sW = Arr[2];
    sH = Arr[3];
    
    //scale
    if (cameraUsed){
        sX *= surfW/cam_w;
        sY *= surfH/cam_h;
        sW *= surfW/cam_w;
        sH *= surfH/cam_h;
    }
    else{
        sX *= surfW/room_width;
        sY *= surfH/room_height;
        sW *= surfW/room_width;
        sH *= surfH/room_height;
    }
    
    //draw
    draw_set_color(c_white);
    draw_rectangle(sX, sY, sX+sW, sY+sH, false);
}

gpu_set_blendmode(bm_normal);

surface_reset_target();

//Draw to surface
surface_set_target(hazeSurf);

//haze_surf_clear(hazeSurf);
draw_clear_alpha(0, 0);

//Draw app surf
shader_set(sh_haze);

shader_set_uniform_f(uniTime, current_time);
gpu_set_texrepeat_ext(uniSamp, true);
var NTex = sprite_get_texture(spr_haze_noise, 0);
texture_set_stage(uniSamp, NTex);
shader_set_uniform_f(uniSampSize, texture_get_width(NTex), texture_get_height(NTex));

shader_set_uniform_f(uniSpeed, hazeSpeed/100);
shader_set_uniform_f(uniSize, hazeSize/1000);
shader_set_uniform_f(uniFreq, hazeWaveLength/2.5);

draw_surface(application_surface, 0, 0);

shader_reset();

//Points
shader_set(sh_mask);
if (!debugMode) gpu_set_blendmode_ext(bm_zero, bm_src_color);
draw_surface(pointSurf, 0, 0);
gpu_set_blendmode(bm_normal);
shader_reset();

//Debug
if (debugMode){
    draw_set_color(c_red);
    draw_rectangle(0, 0, 4, 4, false);
    draw_set_color(c_white);
}

surface_reset_target();

surface_free(pointSurf);

//Draw haze surface
draw_surface(hazeSurf, 0, 0);

//Debug
if (debugMode){
    draw_set_color(c_red);

    draw_text(5, 5, "App surf: " + string(surfW) + ", " + string(surfH) + "\nGUI layer: "
        + string(display_get_gui_width()) + ", " + string(display_get_gui_height()));
        
    draw_set_color(c_white);
}

