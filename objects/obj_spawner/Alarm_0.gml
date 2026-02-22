randomise();
var enemy_to_spawn = 
    choose(
        obj_enemy_1, 
        obj_enemy_1_children, 
        obj_enemy_2, 
        obj_enemy_2_children, 
        obj_enemy_3
    );


var xposition = irandom_range(view_xport - 200, view_xport + 200);
var ypoisiton = irandom_range(view_yport - 200, view_yport + 200);

instance_create_layer(xposition, ypoisiton, "Instances", enemy_to_spawn);

alarm[0] = 180;