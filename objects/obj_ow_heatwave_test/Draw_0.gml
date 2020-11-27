/*
time += 0.01;

gpu_set_tex_filter_ext(u_distort_tex, true);

shader_set(heat_distort_shader);
	texture_set_stage(u_distort_tex, distort_tex);
	shader_set_uniform_f(u_time, time);
	shader_set_uniform_f(u_size, 2);
	shader_set_uniform_f(u_strength, 0.005);
//	shader_set_uniform_f(u_show_result, show_result);
//	draw_surface(application_surface, 0, 0);
draw_self();
shader_reset();
*/

draw_self();