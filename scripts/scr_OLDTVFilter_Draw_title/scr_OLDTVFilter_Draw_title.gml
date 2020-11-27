function scr_OLDTVFilter_Draw_title() {
	//
	//  OLD TV Filter for GameMaker Studio 2
	//
	//  Version 1.0
	//  
	//  Developed by Vortex Game Studios LTDA ME. (http://vortexstudios.com)
	//  Author: Alexandre Ribeiro de Sá (@alexribeirodesa)
	//

	//  ATTENTION!
	//  DO NOT EDIT THIS FILE, USE THE PRESET OBJECT

	// Bilinear Filter
	gpu_set_tex_filter(true);
   
	//  Surface Size
	var window_width  = 1920;
	var window_height = 1080; //window_get_height;
	//original; 1157, 985; 2.0: 1197,985

	var surface_width = 1920;
	var surface_height = 1080; //surface_get_height(application_surface);
	//original; 1157,985

	//	Do nothing if the windows size is too small
	if ( window_width < 1 || window_height < 1 ) {
		return 0;
	}

	var surface_aspect = global.game_lines / window_height;
    
	// Resize GUI
	//display_set_gui_size(surface_width, surface_height);

	if( global.oldtvfilter_enabled ) {
	    //  Surface Flag
	    var surfaceFlag = 0;
    
	    //  Create or Resize the Surfaces
		//	Disable it to keep the aspect ratio??
		//if( !global.keep_aspect_ratio ) {
			//if (surface_width != window_width || surface_height != window_height) {
			//    surface_resize(application_surface, window_width, window_height);
			//}
	//	}
		
	    for( var i=0; i < 2; i++ ) {
	        if( surface_exists(global.bufferSurface[i]) ) {
				if (surface_width != window_width || surface_height != window_height) {
					surface_resize(global.bufferSurface[i], window_width, window_height);
				}
			} else {
	            global.bufferSurface[i] = surface_create( window_width, window_height );
			}
	    }
	
	    surface_set_target(global.bufferSurface[!surfaceFlag]);
	    draw_surface(application_surface, 0, 0); //was -365, -66
	    surface_reset_target();

	    global._oldtv_timer += 15.0 / room_speed;
	    if( global._oldtv_timer > 1.0 ) {
	        global._oldtv_timer -= 1.0;
	        global.noise_offset = random_range(0.0, 10.0);
	        global._composite_kernel_flag = !global._composite_kernel_flag;
	    }
    
	    //  Noise
	    if( global.noise_enabled ) {
	        gpu_set_texrepeat_ext(global._noise_pattern, true);
	        gpu_set_texrepeat_ext(global._static_pattern, true);
	        gpu_set_texrepeat_ext(global._dirt_pattern, true);
    
	        surface_set_target(global.bufferSurface[surfaceFlag]);
	            shader_set(sh_OLDTVFilter_Noise);
	                texture_set_stage(global._noise_pattern, global.noise_pattern);
	                shader_set_uniform_f(global._noise_magnetude, global.noise_magnetude);
	                shader_set_uniform_f(global._noise_offset, global.noise_offset);
                
	              //  texture_set_stage(global._static_pattern, global.static_pattern);
	              //  shader_set_uniform_f(global._static_magnetude, global.static_magnetude*global.static_magnetude);
					//shader_set_uniform_f(global._static_offset, global.static_offset);

	                texture_set_stage(global._dirt_pattern, global.dirt_pattern);
	                shader_set_uniform_f(global._dirt_magnetude, global.dirt_magnetude*global.dirt_magnetude);
                
	                draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	            shader_reset();
	        surface_reset_target();
        
	        surfaceFlag = !surfaceFlag;
	    }
    
    
	    //  Draw
	    draw_surface(global.bufferSurface[!surfaceFlag], 0, 0); //modified 2/23/2020
	    draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	    draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	    draw_surface(global.bufferSurface[!surfaceFlag], 0, 0);
	} else {
	    draw_surface(application_surface, 0, 0);
	}
	// 385, 80 // -385, -75 for else 


}