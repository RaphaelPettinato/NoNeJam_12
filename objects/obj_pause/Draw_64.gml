if (!surface_exists(surf)) {
    surf = surface_create(display_get_gui_width(), display_get_gui_height());
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

draw_sprite_stretched(
    spr_pause,
    image_index,
    0,
    0,
    surface_get_width(surf),
    surface_get_height(surf)
);

surface_reset_target();

draw_surface(surf, 0, 0);