if (mouse_check_button_pressed(mb_right)) 
{
    switch (room) {
        case rm_level_1:
            change_worlds();
            break;
        case rm_menu:
            change_worlds();
            break;
        default:
            break;
    }
    
    var background_white_layer_id = layer_get_id("background_white");
    var background_red_layer_id = layer_get_id("background_red");
    
    var background_white_id = layer_background_get_id(background_white_layer_id);
    var background_red_id = layer_background_get_id(background_red_layer_id);
    
    
    if (global.world == 1) {
        layer_background_visible(background_white_id, true);
        layer_background_visible(background_red_id, false);
    } else if (global.world == 2) {
        layer_background_visible(background_red_id, true);
        layer_background_visible(background_white_id, false);
    }
}

if (global.points > 1000) 
{
    
}