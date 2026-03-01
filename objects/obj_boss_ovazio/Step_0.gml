image_blend = c_white;

if (instance_exists(obj_player) && enemy_follow_player) {
    var target = obj_player;
    
    target_x = target.x;
    target_y = target.y;
    

    var _hor = clamp(target_x - x, -enemy_speed, enemy_speed);
    var _ver = clamp(target_y - y, -enemy_speed, enemy_speed);
    
    var _tilemap_id = layer_tilemap_get_id(global.active_tilemap[0]);
    
    move_and_collide(_hor * enemy_speed, _ver * enemy_speed, [obj_enemy, _tilemap_id]);
}

if (enemy_life <= 0) {
    global.points += enemy_points;
    instance_destroy();
}