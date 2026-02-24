if (!instance_exists(obj_player_hands)) {
    instance_create_layer(x, y, "Instances", obj_player_hands);
}

powerups = ds_list_create();