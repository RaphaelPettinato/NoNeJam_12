if (world == global.world || world == 0)
{
    
    image_blend = c_red;
    
    enemy_life--;
    instance_destroy(other);
}