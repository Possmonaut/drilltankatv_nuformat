image_alpha = 0;

camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, -0);
var pm = matrix_build_projection_ortho(1024, 768,-1000, 100000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = obj_ow_player_tank;

xTo = x;
yTo = y;

curRoom = room;

x = follow.x;
y = follow.y;

camSpeed = 1;

shake = false;
shakeForce = 1;
shakeDur = 5;