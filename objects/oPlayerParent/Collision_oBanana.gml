/// @description 

if state == PLAYER.STUNNED { return; };

// HIT DA BANANA NO AR
if (other.state == ARMA.THROWN && other.owner_id != id){
	knockback(10, other.image_angle);
	hit(1);
	
	for (var i = 1; i < 25; ++i) {
	    with instance_create_layer(x, y, "Instances", oSmoke) {
			direction = 15 * i;
			speed = 2;
		}
	}
}

// HIT NA BANANA NO CHAO
if (other.setted == true && state != PLAYER.STUNNED){
	knockback(10, other.image_angle-180);
	hit(1);
	
	if surface_exists(oDebrisManager.debris_surface) {
		surface_set_target(oDebrisManager.debris_surface);
	
		with(other){
		// substituir com a banana usada
		draw_sprite_ext(sBananaUsada, image_index, x, y+5, image_xscale, image_yscale, image_angle, c_white, 0.8);
		}
		
		surface_reset_target();
	}
	
	
	instance_destroy(other);
	
	for (var i = 1; i < 25; ++i) {
	    with instance_create_layer(x, y, "Instances", oSmoke) {
			direction = 15 * i;
			speed = 2;
		}
	}
}


















