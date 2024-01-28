start_button = keyboard_check(vk_enter) || gamepad_button_check_pressed(gp_index, gp_face1);


if (start_button) {
	//draw_clear_alpha(c_black, 1);
	room_goto(Menu);
}