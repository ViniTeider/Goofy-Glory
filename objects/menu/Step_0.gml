/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

show_debug_message(gamepad_is_connected(gp_index))

start_button = gamepad_button_check_pressed(4, gp_face1);


if (start_button && !global.transitioning) {
    global.transitioning = true;
    global.alpha = 1; // Start the fade-out with full opacity
}


if (global.transitioning) {
    global.alpha -= 0.05; // Adjust the speed of the fade-out here
    if (global.alpha <= 0) {
        global.alpha = 0;
        room_goto_next();
        global.transitioning = false;
        global.alpha = 1; // Reset alpha for fade-in in the new room
    }
}
