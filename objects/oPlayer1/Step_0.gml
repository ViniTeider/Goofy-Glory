/// @desc Insert description here

var left_key = keyboard_check(ord("A"));
var right_key = keyboard_check(ord("D"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));

hsp = (right_key - left_key) * spd;
vsp = (down_key - up_key) * spd;


event_inherited(); // aqui troca pela colisao

x += hsp;
y += vsp;

