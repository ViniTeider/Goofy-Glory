/// @description 

owner_id = other.owner_id;

if destroy {
	
	if surface_exists(oDebrisManager.debris_surface) {
		surface_set_target(oDebrisManager.debris_surface);
	
		draw_sprite_ext(sprite_index, image_index, x, y+5, image_xscale, image_yscale, image_angle, c_white, 1);
	
		surface_reset_target();
	}
	
	instance_destroy();	
}

hit_instance = instance_place(x, y, oPlayerParent);

if hit_instance != noone { // se tivermos uma colisao
	if hit_instance.id != owner_id { // se atingiu algo que nao é o dono
		// aqui a gente da o dano ou sei la o que
		destroy = true; // a bala se mata
	}
}


















