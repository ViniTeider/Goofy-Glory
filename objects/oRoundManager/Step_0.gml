/// @description Insert description here
// You can write your code in this editor

show_debug_message(global.risometro_azul)
show_debug_message(global.risometro_laranja)

if(global.risometro_azul >= 10) {
	global.blueWins++
	gameReset()
}

if(global.risometro_laranja >= 10) {
	global.orangeWins++
	gameReset()
}