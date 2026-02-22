var target_x = lerp(x, obj_player.x, (enemy_speed / 100));
var target_y = lerp(y, obj_player.y, (enemy_speed / 100));

var dx = target_x - x;
var dy = target_y - y;

move_and_collide(dx, dy, obj_enemy);

if (enemy_life <= 0) instance_destroy(); 
    
if (global.world != 1) {
    sprite_index = spr_shadow_white_small;
} else {
    sprite_index = spr_enemy_6;
}