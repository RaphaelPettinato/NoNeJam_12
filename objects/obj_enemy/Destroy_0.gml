global.points += enemy_points;

// chance to drop one random powerup
randomise();
var _random_number = irandom_range(0, 100);
if (_random_number > 80) 
{
    var _powerup = choose(
        obj_powerup_dual_bullets,
        obj_powerup_triple_bullets,
        obj_powerup_life,
        obj_powerup_fast_bullets
    );
    
    instance_create_layer(x, y, "Instances", _powerup);
}