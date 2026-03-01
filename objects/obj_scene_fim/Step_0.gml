if (image_index == 0) return;
if (image_index == 1) 
{
    image_speed = 1;    
}
if (image_index >= 38 and image_index < 46) {
    image_speed = 0;
    space_pressed = false;
}
if (image_index == 46) {
    game_end();
}