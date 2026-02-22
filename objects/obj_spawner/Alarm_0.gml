randomise();

var enemy_to_spawn = choose(
    obj_enemy_1, 
    obj_enemy_1_children, 
    obj_enemy_2, 
    obj_enemy_2_children, 
    obj_enemy_3
);

var margem = 100;

var left   = view_xport;
var top    = view_yport;
var right  = left + view_wport;
var bottom = top + view_hport;

var xposition;
var yposition;
var tentativas = 0;
var max_tentativas = 50;

repeat(max_tentativas)
{
    xposition = irandom_range(left - margem, right + margem);
    yposition = irandom_range(top - margem, bottom + margem);

    var fora_da_view =
        xposition < left ||
        xposition > right ||
        yposition < top ||
        yposition > bottom;

    var livre = (!position_meeting(xposition, yposition, obj_enemy) and !position_meeting(xposition, yposition, obj_player));

    if (fora_da_view && livre) break;

    tentativas++;
}

instance_create_layer(xposition, yposition, "Instances", enemy_to_spawn);

alarm[0] = time_to_spawn;