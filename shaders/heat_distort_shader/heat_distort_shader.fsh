/*
distort_tex		= sprite_get_texture(spr_heat_distortion_leopard, 0);
u_distort_tex	= shader_get_sampler_index(shader, "distort_tex");
u_time			= shader_get_uniform(shader, "time");
u_strength		= shader_get_uniform(shader, "strength");	// should be turned into a constant once you're happy with the setting
u_size			= shader_get_uniform(shader, "size");		// should be turned into a constant once you're happy with the setting

u_show_result	= shader_get_uniform(shader, "show_result");// debug only. remove this and related lines inside the shader

time			= 0;

	
Draw GUI Begin event:
---------------------------------------
time			+= 0.01; // at 60fps
var show_result	= !keyboard_check(vk_space);

gpu_set_tex_filter_ext(u_distort_tex, true);

shader_set(shader);
	texture_set_stage(u_distort_tex, distort_tex);
	shader_set_uniform_f(u_time, time);
	shader_set_uniform_f(u_size, 2);
	shader_set_uniform_f(u_strength, 0.005);
	shader_set_uniform_f(u_show_result, show_result);
	draw_surface(application_surface, 0, 0);
shader_reset();

gpu_set_tex_filter(false);


Clean Up event:
---------------------------------------
application_surface_draw_enable(true);
*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D distort_tex; //change this to the texture

uniform float time;
uniform float size;			// should be turned into a constant once you're happy with the setting
uniform float strength;		// should be turned into a constant once you're happy with the setting

//uniform float show_result;	// debug only. remove this and related lines inside the objects events


void main() {	
	// grab distortion off the distorion texture
	vec2 distort;
	distort.x = texture2D( distort_tex, fract(v_vTexcoord * size		+ vec2(0.0, time))).r		* strength;
	distort.y = texture2D( distort_tex, fract(v_vTexcoord * size * 3.4	+ vec2(0.0, time * 1.6))).g	* strength * 1.3;
	
	//// grab the base colour at the distorted texture coordinate:
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + distort);
	
	 // debug only. remove this:
	//gl_FragColor.rgb = mix(vec3(distort/max(strength,0.0001), 0.0), gl_FragColor.rgb, show_result);
}