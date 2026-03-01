// fim da animaçao
if (sprite_index == spr_boss_inveja_abertura) {
    sprite_index = spr_boss_inveja_idle;
    alarm[1] = attacking_cooldown * 60;
}

// fim do ataque, retorna a idle
if (sprite_index == spr_boss_inveja_ataque_01 || sprite_index == spr_boss_inveja_ataque_02) {
    sprite_index = spr_boss_inveja_idle;
    attacking = false;
    alarm[0] = attacking_cooldown * 60;
}