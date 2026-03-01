// sprite healthbar tem 14 frames
// inimigo tem 140 de vida

// frame 1 = vida cheia
// frame 14 = morreu
// 
var _frame = 14 - (enemy_life / 300) * 14;

var _sprite_to_draw = spr_healthbar_ainveja;

var _sprite_width = sprite_get_width(_sprite_to_draw);


draw_sprite_ext(
    spr_healthbar_ainveja,
    _frame,
    display_get_gui_width() / 2,
    50,
    2,
    2,
    0,
    c_white,
    1
);