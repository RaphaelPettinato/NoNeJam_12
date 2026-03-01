

// se cooldown for positivo, vai reduzir 1 de vida
if (!damage_cooldown && player_life > 0)
{
    
    // quando colidir, a cor vai ser vermelha!
    image_blend = c_red;
    
    // aplica dano
    var _damage = other.enemy_damage;
    
    audio_play_sound(PLAYER_HIT, 1, 0);
    
    player_life -= _damage;

    // inicia cooldown
    damage_cooldown = true;
    alarm[1] = 1 * 60;

    // aplica knockback
    knockback_dir = point_direction(other.x, other.y, x, y);
    knockback_force = 10;
}

// quando morto, volta a ser branco independentemente se estiver colidindo ou nao
if (player_life <= 0) {
    image_blend = c_white;
}