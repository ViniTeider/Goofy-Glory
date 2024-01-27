/// @desc Insert description here

if state == PLAYER.STUNNED { return; };

if (other.owner != self && other.state == ARMA.THROWN && other.owner_id != id){
	knockback(5, image_angle);
	hit(1);
}




