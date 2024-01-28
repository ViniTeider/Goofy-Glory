/// @description Insert description here
// You can write your code in this editor

show_debug_message(global.risometro_azul)
show_debug_message(global.risometro_laranja)

if(global.risometro_azul >= 7) {
	show_debug_message("azul ganhou");
	global.blueWins++
	gameReset()
}

if(global.risometro_laranja >= 7) {
	show_debug_message("laranja ganhou");
	global.orangeWins++
	gameReset()
}