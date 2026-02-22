cam_x = camera_get_view_x(camera_get_active());
cam_y = camera_get_view_y(camera_get_active());

draw_text(cam_x + 20, cam_y + 20, string(global.points));