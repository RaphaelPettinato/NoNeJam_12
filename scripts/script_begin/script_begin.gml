function start_game(){
    global.points = 0;
    global.spawn_speed = 0;
    global.active_tilemap = "";
    global.world = 1;
}

function change_worlds() 
{
    global.world = (global.world == 1) ? 2 : 1;
}

function create_children(x, y, layer, objeto, quantidade)
{
    var dist = 32;

    for (var i = 0; i < quantidade; i++)
    {
        randomise();
        var ang = irandom(359);
        var new_x = x + lengthdir_x(dist, ang);
        var new_y = y + lengthdir_y(dist, ang);

        if (!position_meeting(new_x, new_y, obj_enemy))
        {
            instance_create_layer(new_x, new_y, layer, objeto);
        }
    }
}