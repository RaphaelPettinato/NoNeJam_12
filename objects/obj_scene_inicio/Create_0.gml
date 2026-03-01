start_game();

image_speed = 0;

audio_play_sound(_01_INTRO, 1, 1);

gui_x = display_get_gui_width() / 2;
gui_y = 50;

if (global.tutorial) {
    room_goto(rm_menu);
}