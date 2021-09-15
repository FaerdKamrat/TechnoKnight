// får tag i den nuvarande camrar postion.

var _camX = camera_get_view_x(camera);
var _camY = camera_get_view_y(camera);

// sätter kamera postion
var _targetX = obj_Player.x+(20*obj_Player.image_xscale) - RES_W/2;
var _targetY = obj_Player.y - RES_H/2;

// clampar så attt kamra inte rar utanför rummet.
_targetX = clamp(_targetX, 0, room_width - RES_W);
_targetY = clamp(_targetY, 0, room_height - RES_H);

// lerpar camra rörelsen.
_camX = lerp(_camX, _targetX, CAM_SMOOTH);
_camY = lerp(_camY, _targetY, CAM_SMOOTH+0.1);

//apply camera postioen.
camera_set_view_pos(camera, _camX, _camY);

