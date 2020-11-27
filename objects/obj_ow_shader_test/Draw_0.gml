shader_set(distance_shader);
shader_set_uniform_f(distMult, distToPlayer);
draw_self();
shader_reset();

draw_text(x, y - 20, distToPlayer);