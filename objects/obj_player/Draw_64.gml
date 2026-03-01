var margin = 20;
var scale = 2;
var spr_w = sprite_get_width(spr_vidas) * scale;

var frame;

// --- animação de perda de vida ---
if (lost_life)
{
    switch (player_life)
    {
        case 2: frame = 2 + (life_anim_frame mod 3); break; // frames 2–4
        case 1: frame = 7 + (life_anim_frame mod 3); break; // frames 7–9
        case 0: frame = 12 + (life_anim_frame mod 3); break; // frames 12–14
        default: frame = 0; // fallback
    }
}
else
{
    // --- estado idle ---
    var base_frame;

    switch (player_life)
    {
        case 3: base_frame = 0; break; // frames 0–1
        case 2: base_frame = 5; break; // frames 5–6
        case 1: base_frame = 9; break; // frames 9–10
        default: base_frame = 15;      // frames 15–16
    }

    // alterna entre os dois frames do par
    frame = base_frame + (floor(current_time / 300) mod 2);
}

// desenha o sprite de vudas
draw_sprite_ext(
    spr_vidas,
    frame,
    display_get_gui_width() - spr_w - margin,
    spr_w / 1.5,
    scale,
    scale,
    0,
    c_white,
    1
);



// powerups desenho
margin = 40;
var spacing = 50;
var drawn = ds_list_create();

var draw_index = 0;

for (var i = 0; i < ds_list_size(powerups); i++)
{
    var p = powerups[| i];
    
    var _sprite_to_draw = p.sprite;

    if (ds_list_find_index(drawn, p.powerup_name) == -1)
    {
        frame = floor(current_time / 100) mod sprite_get_number(_sprite_to_draw);
        
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