/// @desc Insert description here

draw_self();

if player_contact && state == ARMA.GROUND {
	draw_text(x - 70, y - 50, "Pressione para pegar a arma");
}