/// @description 

if state == PLAYER.STUNNED { return; };

if (other.setted == true && state != PLAYER.STUNNED){
	knockback(10, other.image_angle-180);
	hit(1);
	instance_destroy(other);
}


















