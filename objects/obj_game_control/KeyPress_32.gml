switch (global.phase) {
    case 1:
        if (global.points >= 2000) { 
            room_goto(rm_boss_ovazio);
        }
        break;
    case 2:
        if (global.points >= 3000) {
            room_goto(rm_boss_ainveja);
        }
        break;
}