if (room == rm_level_ovazio) {
    progress = global.points / 2000;
} else {
    progress = global.points / 3000;
}

if (progress >= 1) {
    var gui_x = display_get_gui_width() / 2;
    
    frame = floor(current_time / 300) mod 2;

    draw_sprite(
        spr_press_space,
        frame,
        gui_x,
        50
    );
}