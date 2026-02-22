// Inherit the parent event
event_inherited();

if (enemy_shoots and !cooldown) 
{
    cooldown = true;
    instance_create_layer(x, y, "Instances", obj_enemy_3_bullet);
    alarm[0] = 30;
}

