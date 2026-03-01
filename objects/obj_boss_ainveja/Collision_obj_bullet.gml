if (can_take_damage)
{
    instance_destroy(other);
    enemy_life -= 1;
    image_blend = c_red;
    sprite_index = spr_boss_inveja_hit;
}

