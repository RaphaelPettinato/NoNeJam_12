if (sprite_index == spr_boss_inveja_abertura) return; // espera animação de abertura

can_take_damage = obj_torre_olho_direito.closed and obj_torre_olho_esquerdo.closed; // verifica se pode tomar dano

image_blend = c_white;

if (enemy_life <= 0) {
    instance_destroy();
}

// patrulha horizontal
if (!attacking) {
    var _hor = patrol_dir * enemy_speed;
    move_and_collide(_hor, 0, [obj_enemy]);
    y = patrol_y; // garante que Y permanece fixo
    if (x >= x_maximum) patrol_dir = -1;
    if (x <= x_minimum) patrol_dir = 1;
}

// ataque
if (attacking) {
    if (attack_phase == 1) { // vai para posição do jogador
        var _hor = clamp(attack_target_x - x, -enemy_speed*1.5, enemy_speed*1.5);
        var _ver = clamp(attack_target_y - y, -enemy_speed*1.5, enemy_speed*1.5);
        move_and_collide(_hor, _ver, [obj_enemy]);
        if (abs(x - attack_target_x) < 5 and abs(y - attack_target_y) < 5) attack_phase = 2;
    } 
    else if (attack_phase == 2) { // retorna à posição de patrulha
        var _hor = clamp(attack_start_x - x, -enemy_speed*1.2, enemy_speed*1.2);
        var _ver = clamp(attack_start_y - y, -enemy_speed*1.2, enemy_speed*1.2);
        move_and_collide(_hor, _ver, [obj_enemy]);
        if (abs(x - attack_start_x) < 5 and abs(y - attack_start_y) < 5) {
            attacking = false;
            attack_phase = 0;
            can_attack = true;
        }
    }
}

// inicia ataque
if (!attacking and can_attack and !can_take_damage) {
    attacking = true;
    can_attack = false;

    attack_start_x = x;
    attack_start_y = y;

    if (instance_exists(obj_player)) {
        attack_target_x = obj_player.x;
        attack_target_y = obj_player.y;
    }

    attack_phase = 1;
    var _attack = choose(spr_boss_inveja_ataque_01, spr_boss_inveja_ataque_02);
    sprite_index = _attack;
    image_speed = 0.5;
}