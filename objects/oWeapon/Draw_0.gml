/// @desc Insert description here

draw_self();

if state == ARMA.GROUND {
	image_xscale = 1.5 * sign(image_xscale)
	image_yscale = 1.5 * sign(image_yscale);
}
else if state == ARMA.OWNED {
	image_xscale = 1 * sign(image_xscale)
	image_yscale = 1 * sign(image_yscale);
}

if player_contact && state == ARMA.GROUND {
	draw_text(x - 70, y - 50, "Pressione para pegar a arma");
}