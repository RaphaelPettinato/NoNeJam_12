switch (btn_name) 
{
    case "sair":
        end_game();
        break;
    case "iniciar":
        if (!global.tutorial) {
            room_goto(rm_level_tutorial);
        } else {
            if (global.phase == 1) {
                room_goto(rm_level_ovazio);
            }
            if (global.phase == 2) {
                room_goto(rm_level_ainveja);
            }
        }
        break;
}