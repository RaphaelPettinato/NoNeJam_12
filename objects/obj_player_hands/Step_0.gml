if (instance_exists(obj_player)) 
{
    var _player = obj_player;
    
    var max_dist = 20;
    
    var dir = point_direction(_player.x, _player.y, mouse_x, mouse_y);
    
    var dist = point_distance(_player.x, _player.y, mouse_x, mouse_y);
    
    dist = clamp(dist, 15, max_dist);
    
    x = _player.x + lengthdir_x(dist, dir);
    y = _player.y + lengthdir_y(dist, dir);
    
    if (!instance_exists(obj_player_hands)) {
        instance_create_layer(x, y, "Instances", obj_player_hands);
    }
    
    image_angle = dir;
}