/// @desc Insert description here
if (other.owner_id != id){
	knockback(5, other.image_angle);
	audio_play_sound(buzina_PEEEEN_ggjcwb,0,false,1,0);
	hit(3);
	
	for (var i = 1; i < 25; ++i) {
	    with instance_create_layer(x, y, "Instances", oSmoke) {
			direction = 15 * i;
			speed = 2;
		}
	}
	instance_destroy(other)
}


