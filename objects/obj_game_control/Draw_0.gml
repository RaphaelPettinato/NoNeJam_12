cam_x = camera_get_view_x(camera_get_active());
cam_y = camera_get_view_y(camera_get_active());

draw_text(cam_x + 20, cam_y + 20, string(global.points));


var progress = 0;

if (room == rm_level_ovazio) {
    progress = global.points / 2000;
} else {
    progress = global.points / 3000;
}

var stage = clamp(floor(progress * 4), 0, 4);

var base_frame = stage * 2;

var frame = base_frame + (current_time div 300 mod 2);

var _sprite_to_draw = "";

switch(room) {
    case rm_level_ainveja:
        _sprite_to_draw = spr_boss_bar_ovazio;
        break;
    case rm_level_ovazio:
        _sprite_to_draw = spr_boss_bar_ovazio;
        break;
}

if (_sprite_to_draw != "") {
    draw_sprite_ext(_sprite_to_draw, frame, cam_x + 20, cam_y + 240, 1, 2, 0, c_white, 1);    
}