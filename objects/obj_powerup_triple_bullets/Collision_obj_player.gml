// Inherit the parent event
event_inherited();

var p = {
    powerup_name: object_get_name(object_index),
    sprite: sprite_index,
    time: powerup_duration
};

ds_list_add(other.powerups, p);

// percorre lista de powerups ativos
for (var i = ds_list_size(other.powerups) - 1; i >= 0; i--)
{
    var existing = other.powerups[| i];

    if (existing.powerup_name == "obj_powerup_dual_bullets")
    {
        existing.time = 0;
    }
    
    if (existing.powerup_name == "obj_powerup_triple_bullets") 
    {
        existing.time = powerup_duration;
    }
}

// adiciona o novo powerup
ds_list_add(other.powerups, p);
