/// @description Insert description here
// You can write your code in this editor

//show_debug_message(global.risometro_azul)
//show_debug_message(global.risometro_laranja)

global.risometro_azul = max(0, global.risometro_azul)
global.risometro_laranja = max(0, global.risometro_laranja)


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