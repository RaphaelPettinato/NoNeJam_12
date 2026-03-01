var gui_x = display_get_gui_width() / 2;

if (image_index == 0 || image_index >= 38 and image_index < 46) {

    var frame = floor(current_time / 300) mod 2;

    draw_sprite(
        spr_press_space,
        frame,
        gui_x,
        50
    );
}