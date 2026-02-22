global.points = 0;
global.spawn_speed = 0;
global.active_tilemap = "";
global.world = 1;
global.loaded = false;
global.pause = false;

function start_game(){
    load_game();
}

function save_game()
{
    var _struct = {
        points: global.points
    };
    
    var _string = json_stringify(_struct);
    
    var _buff = buffer_create(0, buffer_grow, 1);
    
    buffer_write(_buff, buffer_string, _string);
    
    buffer_save(_buff, "save.json");
    
    buffer_delete(_buff);
}

function load_game()
{
    var _path = "save.json";

    if (file_exists(_path)) 
    {
        var _buffer = buffer_load(_path);
        var _json = buffer_read(_buffer, buffer_string);
        
        buffer_delete(_buffer);

        var _data = json_parse(_json);
        
        if (is_struct(_data) && variable_struct_exists(_data, "points"))
        {
            global.points = _data.points;
        }
    }
}

function change_worlds() 
{
    global.world = (global.world == 1) ? 2 : 1;
}

function create_children(x, y, layer, objeto, quantidade)
{
    var dist = 64;

    for (var i = 0; i < quantidade; i++)
    {
        randomise();
        var ang = irandom(359);
        var new_x = x + lengthdir_x(dist, ang);
        var new_y = y + lengthdir_y(dist, ang);

        if (!position_meeting(new_x, new_y, obj_enemy) and !position_meeting(new_x, new_y, obj_player))
        {
            instance_create_layer(new_x, new_y, layer, objeto);
        }
    }
}

function end_game() 
{
    save_game();
    game_end();
}
