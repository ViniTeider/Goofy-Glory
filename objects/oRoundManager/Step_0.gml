/// @description Insert description here
// You can write your code in this editor

//show_debug_message(global.risometro_azul)
//show_debug_message(global.risometro_laranja)

alarm[1] = 600
alarm[2] = 600

global.risometro_azul = max(0, global.risometro_azul)
global.risometro_laranja = max(0, global.risometro_laranja)

global.time_on_screen = global.time_on_screen > 1800 ? 1800 : (global.time_on_screen + 1);

if(!hasWinner) {
	if(global.risometro_azul >= 10) {
	hasWinner = true
	
	global.blueWins++
	winCutscene(oPlayer1);
	}

	if(global.risometro_laranja >= 10) {
		hasWinner = true
	 
		global.orangeWins++
		winCutscene(oPlayer2);
	}	
}