global.points = 0;
global.spawn_speed = 0;
global.active_tilemap = [];
global.world = 1;
global.loaded = false;
global.pause = false;
global.tutorial = false;
global.phase = 1;

// funçao que inicializa o jogo
function start_game(){
    load_game();
}

// funçao para salvar o jogo
function save_game()
{
    var _struct = {
        points: global.points,
        tutorial: global.tutorial,
        phase: global.phase,
    };
    
    var _string = json_stringify(_struct);
    
    var _buff = buffer_create(0, buffer_grow, 1);
    
    buffer_write(_buff, buffer_string, _string);
    
    buffer_save(_buff, "save.json");
    
    buffer_delete(_buff);
}

// funçao para fazer o load do jogo
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
        
        if (is_struct(_data) && variable_struct_exists(_data, "tutorial")) 
        {
            global.tutorial = _data.tutorial;   
        }
        
        if (is_struct(_data) && variable_struct_exists(_data, "phase")) 
        {
            global.phase = _data.phase;   
        }
    }
}

function delete_save() {
    file_delete("save.json");
}

// funçao para atualizar os "mundos"
function change_worlds() 
{
    global.world = (global.world == 1) ? 2 : 1;
}

// funçao para criar os filhos dos monstros
function create_children(x, y, layer, objeto, quantidade)
{
    var dist = 32;

    for (var i = 0; i < quantidade; i++)
    {
        randomise();
        var ang = choose(45, 90, 135, 190, 235, 280);
        var new_x = x + lengthdir_x(dist, ang);
        var new_y = y + lengthdir_y(dist, ang);

        if (!position_meeting(new_x, new_y, obj_enemy) and !position_meeting(new_x, new_y, obj_player))
        {
            instance_create_layer(new_x, new_y, layer, objeto);
        }
    }
}

// funçao para chamar o save game e fechar o jogo!
function end_game() 
{
    save_game();
    game_end();
}

// funçao para atirar piu piu
function shoot(quantidade)
{
    var offset = 8;
    
    instance_create_layer(obj_player_hands.x, obj_player_hands.y, "Instances", obj_animation);
    
    switch (quantidade) {
        case 1:
            instance_create_layer(
                obj_player_hands.x,
                obj_player_hands.y,
                "Instances",
                obj_bullet
            );
            break;
        case 2:
            // tiro esquerdo
            instance_create_layer(
                obj_player_hands.x - offset,
                obj_player_hands.y,
                "Instances",
                obj_bullet
            );
        
            // tiro direito
            instance_create_layer(
                obj_player_hands.x + offset,
                obj_player_hands.y,
                "Instances",
                obj_bullet
            );
            break;
        case 3:
            // tiro esquerdo
            instance_create_layer(
                obj_player_hands.x - offset,
                obj_player_hands.y,
                "Instances",
                obj_bullet
            );
            
            // tiro esquerdo
            instance_create_layer(
                obj_player_hands.x,
                obj_player_hands.y,
                "Instances",
                obj_bullet
            );
        
            // tiro direito
            instance_create_layer(
                obj_player_hands.x + offset,
                obj_player_hands.y,
                "Instances",
                obj_bullet
            );
            break;
    }
    
    audio_play_sound(TIRO, 1, 0);
}

// funçao para checar colisao com objeto e tilemap
function colide(_x, _y, _tilemaps)
{
    var left = _x + bbox_left - x;
    var right = _x + bbox_right - x;
    var top = _y + bbox_top - y;
    var bottom = _y + bbox_bottom - y;

    // colisão com objeto
    if (place_meeting(_x, _y, obj_collision))
        return true;

    for (var i = 0; i < array_length(_tilemaps); i++)
    {
        var tilemap = layer_tilemap_get_id(_tilemaps[i]);

        if (tilemap != -1)
        {
            if (
                tilemap_get_at_pixel(tilemap, left, top) != 0 ||
                tilemap_get_at_pixel(tilemap, right, top) != 0 ||
                tilemap_get_at_pixel(tilemap, left, bottom) != 0 ||
                tilemap_get_at_pixel(tilemap, right, bottom) != 0
            )
            {
                return true;
            }
        }
    }

    return false;
}
