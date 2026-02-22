switch (btn_name) 
{
    case "sair":
        game_end();
        break;
    case "iniciar":
        global.active_tilemap = "TREE_01";
        room_goto(rm_level_1);
        break;
}