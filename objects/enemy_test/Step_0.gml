// Inherit the parent event
event_inherited();

if (global.world != 1) {
    sprite_index = spr_shadow_white_small;
} else {
    sprite_index = spr_enemy_3;
}

mask_index = spr_enemy_3;