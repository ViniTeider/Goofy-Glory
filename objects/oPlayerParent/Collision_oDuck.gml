/// @desc Insert description here

if state == PLAYER.STUNNED { return; };

if (other.owner != self && other.state == ARMA.THROWN && other.owner_id != id){
	knockback(10, other.image_angle);
	hit(1);
	audio_play_sound(RUBBER_DUCK,0,false,1,0)
	
	for (var i = 1; i < 25; ++i) {
	    with instance_create_layer(x, y, "Instances", oSmoke) {
			direction = 15 * i;
			speed = 2;
		}
	}
}