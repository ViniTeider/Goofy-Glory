/// @desc Insert description here

draw_self();

if player_contact && state == ARMA.GROUND {
	//draw_text(x - 70, y - 50, "Pressione para pegar a arma");
	var _w = 2;
	gpu_set_fog(true, c_white, 0, 1000)
	draw_sprite_ext(sprite_index, image_index, x + _w, y + _w, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x + _w, y - _w, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x - _w, y + _w, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x - _w, y - _w, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	gpu_set_fog(false, c_white,0,1000)
	//draw_sprite(sprite_index, image_index, x, y);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}