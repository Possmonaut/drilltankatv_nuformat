x=target.x;
y=target.y;

timer ++;

if(timer > clearTime)
{
mp_grid_clear_all(global.mp_grid32);
mp_grid_add_instances(global.mp_grid32, obj_ow_nopass_enemy, 1);
clearTime = timer + 60;
}


//later on we'll probably need this object to update the cells as objects and stuff move around 

