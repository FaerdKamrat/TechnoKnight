//Resolution macros
#macro RES_W 960
#macro RES_H 540
#macro RES_SCALE 1

#macro CAM_SMOOTH 0.09

//Enable views
view_enabled = true;
view_visible[0] = true;

// Create camera
camera = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, camera);

// resize window and aplcation surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE, );

display_set_gui_size(RES_W, RES_H);

// Center the window

var _diplayW = display_get_width();
var _diplayH = display_get_height();

var _windowW = RES_W * RES_SCALE;
var _windowH = RES_H * RES_SCALE;

window_set_position(_diplayW/2 - _windowW/2, _diplayH/2 - _windowH/2);

