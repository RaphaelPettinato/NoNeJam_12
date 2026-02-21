if (instance_exists(obj_player)) {

    var alvo = obj_player;

    x = lerp(x, alvo.x, 0.05);
    y = lerp(y, alvo.y, 0.05);
}