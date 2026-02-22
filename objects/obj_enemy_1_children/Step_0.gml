// Inherit the parent event
event_inherited();

if (global.world != 2) {
    sprite_index = spr_shadow_red_small;
} else {
    sprite_index = spr_enemy_1;
}

mask_index = spr_enemy_1;