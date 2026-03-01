global.pause = !global.pause;
if (global.pause) {
    instance_deactivate_all(true);
    instance_create_layer(x, y, "Instances", obj_pause);
    instance_activate_object(obj_game_control);
} else if (!global.pause) {
    instance_destroy(obj_pause);
    instance_activate_all();
}