if (player_life <= 0) {
    moving = false;
    sprite_index = spr_player_dying;
}

if (moving) {
    var _vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var attacking = mouse_check_button(mb_left);
    var is_moving = (_vertical != 0 || _horizontal != 0);

    // movement
    tilemap_id = layer_tilemap_get_id(global.active_tilemap);
    
    move_and_collide(_horizontal * player_speed, _vertical * player_speed, [tilemap_id]);

    if (_horizontal < 0) image_xscale = -1;
    else if (_horizontal > 0) image_xscale = 1;

    if (attacking && !is_moving) {
        
        sprite_index = spr_player_attacking_stoped;
        
        if (!cooldown) 
        {
            cooldown = true;
            instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_animation);
            instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_bullet);
            alarm[0] = 15;
        }
        
    } else if (attacking && is_moving) {
        sprite_index = spr_player_attacking;
        
        if (!cooldown) 
        {
            cooldown = true;
            instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_animation);
            instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_bullet);
            alarm[0] = 15;
        }

    } else if (is_moving) {
        sprite_index = spr_player_running;
    } else {
        sprite_index = spr_player_idle;
    }
}