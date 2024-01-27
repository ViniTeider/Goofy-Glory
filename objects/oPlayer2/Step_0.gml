/// @desc Insert description here


var left_key = keyboard_check(vk_left);
var right_key = keyboard_check(vk_right);
var up_key = keyboard_check(vk_up);
var down_key = keyboard_check(vk_down);

pick_key = keyboard_check_pressed(pick_keyy);

hsp = (right_key - left_key) * spd;
vsp = (down_key - up_key) * spd;

event_inherited();

x += hsp;
y += vsp;

