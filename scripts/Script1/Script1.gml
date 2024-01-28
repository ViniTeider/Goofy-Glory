// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum PLAYER {
	NORMAL, // 0
	STUNNED, // 1
	LOST
}

global.risometro_laranja = 0;
global.risometro_azul = 0;
global.orangeWins = 0
global.blueWins = 0
global.roundQuantity = 3;
global.time_on_screen = 0;

enum COLOR {
	BLUE,
	ORANGE
}

randomize()

function randInt(from, to) {
	return from + floor(random(to - from))
}