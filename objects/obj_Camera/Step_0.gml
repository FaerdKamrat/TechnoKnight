// get current camera postion

var _camX = camera_get_view_x(camera);
var _camY = camera_get_view_y(camera);

// Set target camera postion
var _targetX = obj_Player.x - RES_W/2;
var _targetY = obj_Player.y - RES_H/2;

// clamp the target to room bounds
_targetX = clamp(_targetX, 0, room_width - RES_W);
_targetY = clamp(_targetY, 0, room_height - RES_H);

// Smoothly move the camera to the target
_camX = lerp(_camX, _targetX, CAM_SMOOTH);
_camY = lerp(_camY, _targetY, CAM_SMOOTH);

//apply camera postion
camera_set_view_pos(camera, _camX, _camY);

