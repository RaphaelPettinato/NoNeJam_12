if (moving) {
    // movement
    var _vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    var _horizontal = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    
    y += _vertical * player_speed;
    x += _horizontal * player_speed;
    
    if (_horizontal < 0) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }
    
    if (_vertical != 0 || _horizontal != 0) {
        sprite_index = Spr_PLAYER_RUNNING;
    }
    
    if (_horizontal == 0 and _vertical == 0) {
        sprite_index = Spr_PLAYER_IDLE;
    }
    
    if (mouse_check_button(mb_left)) {
        sprite_index = Spr_PLAYER_ATTACK;
        
        if (!cooldown) {
            cooldown = true;
            instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_animation);
            instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_bullet);
            alarm[0] = 15;
        }
    }
    
    if (player_life <= 0) {
        moving = false;
        sprite_index = Spr_PLAYER_DEAD;
    }
}