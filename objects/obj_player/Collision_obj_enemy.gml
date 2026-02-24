// quando colidir, a cor vai ser vermelha!
image_blend = c_red;

// se cooldown for positivo, vai reduzir 1 de vida
if (!damage_cooldown and player_life > 0) {
    damage_cooldown = true;
    
    var _damage = obj_enemy.enemy_damage;
    
    player_life -= _damage;
}

// quando morto, volta a ser branco independentemente se estiver colidindo ou nao
if (player_life <= 0) {
    image_blend = c_white;
}

// alarme de 0,5s para reativar o cooldown de dano e a cor da personagem
alarm[1] = 30;