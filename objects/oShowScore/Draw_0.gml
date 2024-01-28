/// @description Insert description here
// You can write your code in this editor

//draw_set_font(fBig);

//draw_text_outline(room_width / 2, room_height / 2, c_black, c_white, $"{global.orangeWins} - {global.blueWins} ");

//draw_set_font(fDefault)
qnt = global.roundQuantity;


scoreW = sprite_get_width(sDuckScore)
scoreH = sprite_get_height(sDuckScore)

start =  (room_width / 2) - (5 * qnt + 22 * qnt) / 2

draw_sprite(sP1Text, -1, start, (room_height / 2) - scoreH/1.5);
draw_sprite(sP2Text, -1, start, (room_height / 2) + scoreH/1.5);

blueScore = global.blueWins
orangeScore = global.orangeWins

for(var i = 1; i < qnt+1; i++) {
	px = scoreW * i + (scoreW/4) * i
	if(orangeScore) >= i draw_sprite(sDuckScore, -1, start + px, (room_height / 2) - scoreH/1.5);
	else draw_sprite(sDuckScoreGray, -1, start + px, (room_height / 2) - scoreH/1.5);
	
	if(blueScore) >= i draw_sprite(sDuckScore, -1, start + px, (room_height / 2) + scoreH/1.5);
	else draw_sprite(sDuckScoreGray, -1, start + px, (room_height / 2) + scoreH/1.5);
}