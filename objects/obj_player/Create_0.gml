if (!instance_exists(obj_player_hands)) {
    instance_create_layer(x, y, "Instances", obj_player_hands);
}

powerups = ds_list_create();

knockback_force = 0;
knockback_dir = 0;

// para ver se o jogador perdeu vida | animaçao das vidas
last_player_life = player_life;
lost_life = false;
life_anim_timer = 0;
life_anim_frame = 0;