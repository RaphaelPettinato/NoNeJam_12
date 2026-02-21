if (instance_exists(obj_player) and enemy_follow_player) {
    var alvo = obj_player;
    x = lerp(x, alvo.x, 0.01);
    y = lerp(y, alvo.y, 0.01);
}

if (enemy_life <= 0) {
    instance_destroy();
}