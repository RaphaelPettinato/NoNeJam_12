if (player_life <= 0) {
    moving = false;
    sprite_index = spr_player_dying;
}

for (var i = ds_list_size(powerups) - 1; i >= 0; i--)
{
    var p = powerups[| i];
    p.time--;
    
    switch (p.powerup_name) 
    {
        case "obj_powerup_triple_bullets":
            if (p.time > 0) 
            {
                triple_shoot = true;    
            } else {
                triple_shoot = false;
            }
            break;
        case "obj_powerup_dual_bullets":
            if (p.time > 0) {
                double_shoot = true;
            } else {
                double_shoot = false;
            }
            break;
    }
    

    if (p.time <= 0)
        ds_list_delete(powerups, i);
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
            
            if (double_shoot) {
                shoot(2);
            } else {
                shoot(1);
            }
            
            alarm[0] = cooldown_time;
        }
        
    } else if (attacking && is_moving) {
        sprite_index = spr_player_attacking;
        
        if (!cooldown) 
        {
            cooldown = true;
            
            if (double_shoot) {
                shoot(2);
            } else if (triple_shoot) {
                shoot(3);
            } else {
                shoot(1);
            }
            
            alarm[0] = cooldown_time;
        }

    } else if (is_moving) {
        sprite_index = spr_player_running;
    } else {
        sprite_index = spr_player_idle;
    }
}