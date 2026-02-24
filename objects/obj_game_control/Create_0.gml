if (room==rm_menu and !global.loaded) 
{
    global.loaded = true;
    start_game();
}

if (room==rm_boss_1) {
    global.active_tilemap = "tile_collision";
}