// Inherit the parent event
event_inherited();

if (enemy_shoots and !cooldown and global.world == 1) 
{
    cooldown = true;
    instance_create_layer(x, y, "Instances", obj_enemy_3_bullet);
    alarm[0] = 30;
}

if (global.world != 1) {
    sprite_index = spr_shadow_white_normal;
} else {
    sprite_index = spr_enemy_7;
}