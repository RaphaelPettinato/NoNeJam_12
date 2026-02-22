switch (btn_name) 
{
    case "sair":
        end_game();
        break;
    case "iniciar":
        global.active_tilemap = "TREE_01";
        room_goto(rm_level_1);
        break;
}