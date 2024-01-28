/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (global.transitioning) {
    if (!surface_exists(global.transition_surface)) {
        global.transition_surface = surface_create(room_width, room_height);
        surface_set_target(global.transition_surface);
        draw_clear_alpha(c_black, 0);
        
        surface_reset_target();
    }
    draw_surface_ext(global.transition_surface, 0, 0, 1, 1, 0, c_black, global.alpha);
} else {
    if (surface_exists(global.transition_surface)) {
        surface_free(global.transition_surface);
        global.transition_surface = -1;
    }
}


