switch (room) {
    case rm_menu:
        if (!audio_is_playing(_01_INTRO)) {
            audio_play_sound(_01_INTRO, 1, 1); 
        }
        if (!global.loaded) {
            global.loaded = true;
            start_game();
        }
        break;
    case rm_level_ovazio:
        audio_stop_all();
        window_set_cursor(cr_none);
        global.active_tilemap = ["TREE_02", "IGREJA"];
        audio_play_sound(_02_VAZIO, 1, 1);
        break;
    case rm_level_ainveja:
        audio_stop_all();
        window_set_cursor(cr_none);
        global.active_tilemap = ["TREE_02"];
        audio_play_sound(_03_BOSS_MUSIC, 1, 1);
        break;
    case rm_level_tutorial:
        audio_stop_all();
        window_set_cursor(cr_none);
        audio_play_sound(_02_VAZIO, 1, 1);
        global.active_tilemap = ["TREE_01"];
        break;
    case rm_boss_ainveja:
        audio_stop_all();
        window_set_cursor(cr_none);
        global.active_tilemap = ["tile_collision"];
        audio_play_sound(_03_BOSS_MUSIC, 1, 1);
        break;
    case rm_boss_ovazio:
        audio_stop_all();
        window_set_cursor(cr_none);
        global.active_tilemap = ["tile_collision"];
        audio_play_sound(_03_BOSS_MUSIC, 1, 1);
        break;
}