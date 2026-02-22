if (damage_cooldown) {
    player_life--;
}

image_blend = c_red;

if (player_life <= 0) {
    image_blend = c_white;
}

alarm[1] = 15;