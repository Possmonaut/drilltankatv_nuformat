velocity = 0;
acc = 0.1;

angleDir = 0;

visualSpriteDrill = instance_create_depth(x +16, y +16, -2, obj_ow_test_drill);
visualSpriteDrill.image_angle = 270;

timer = 0;
dirTimer = 0;
rPause = false;

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);

facing = 0;

collisionVeloX = x;
collisionVeloY = y;

RPosX = 0;
RPosY = 0;

rOffset = 0;
distOffset = 0;