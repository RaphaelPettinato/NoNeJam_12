var margin = 40;
var spacing = 50;
var drawn = ds_list_create();

var draw_index = 0;

for (var i = 0; i < ds_list_size(powerups); i++)
{
    var p = powerups[| i];
    
    var _sprite_to_draw = p.sprite;

    if (ds_list_find_index(drawn, p.powerup_name) == -1)
    {
        var frame = floor(current_time / 100) mod sprite_get_number(_sprite_to_draw);
        
        draw_sprite_ext(
            _sprite_to_draw,
            frame,
            display_get_gui_width() - margin,
            margin + draw_index * spacing,
            2,
            2,
            0,
            c_white,
            1
        );

        ds_list_add(drawn, p.powerup_name);
        draw_index++;
    }
}

ds_list_destroy(drawn);