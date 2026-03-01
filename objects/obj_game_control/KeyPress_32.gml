switch (global.phase) {
    case 1:
        if (global.points >= 2000) { 
            if (room != rm_boss_ainveja and room != rm_boss_ovazio) {
                room_goto(rm_boss_ovazio);
            }
        }
        break;
    case 2:
        if (global.points >= 3000) {
            if (room != rm_boss_ainveja and room != rm_boss_ovazio) {
                room_goto(rm_boss_ainveja);   
            }
        }
        break;
}