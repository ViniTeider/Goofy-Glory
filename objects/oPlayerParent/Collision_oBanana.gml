/// @description 

if state == PLAYER.STUNNED { return; };

if (other.setted == true && state != PLAYER.STUNNED){
	knockback(10, other.image_angle-180);
	hit(1);
	instance_destroy(other);
	
	for (var i = 1; i < 25; ++i) {
	    with instance_create_layer(x, y, "Instances", oSmoke) {
			direction = 15 * i;
			speed = 2;
		}
	}
}


















