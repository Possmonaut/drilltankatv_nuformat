if(image_alpha = 1)
{
shader_set(distance_shader);
shader_set_uniform_f(distMult, distMultC);
draw_self();
shader_reset();
}
else
{}