cursor_sprite = spr_aim;

audio_stop_all();

switch (room) {
    case rm_menu:
        
        audio_play_sound(_01_INTRO, 1, 1);
        
        if (!global.loaded) {
            global.loaded = true;
            start_game();
        }
        break;
    case rm_level_ovazio:
        window_set_cursor(cr_none);
        global.active_tilemap = ["TREE_01", "IGREJA"];
        audio_play_sound(_02_VAZIO, 1, 1);
        break;
    case rm_level_ainveja:
        window_set_cursor(cr_none);
        global.active_tilemap = ["TREE_01"];
        audio_play_sound(_04_JUNGLE_BEAT, 1, 1);
        break;
    case rm_level_tutorial:
        window_set_cursor(cr_none);
        audio_play_sound(_02_VAZIO, 1, 1);
        global.active_tilemap = ["TREE_01"];
        break;
    case rm_boss_ainveja:
        window_set_cursor(cr_none);
        global.active_tilemap = ["tile_collision"];
        audio_play_sound(_03_BOSS_MUSIC, 1, 1);
        break;
    case rm_boss_ovazio:
        window_set_cursor(cr_none);
        global.active_tilemap = ["tile_collision"];
        audio_play_sound(_03_BOSS_MUSIC, 1, 1);
        break;
}