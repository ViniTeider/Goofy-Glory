if (other.owner != self && other.state == ARMA.THROWN && other.owner_id != id){
	hit(1);
	other.state = ARMA.PIED
	other.owner = self;
	other.sprite_index = sPieHit;
	other.image_angle  = 0;
}
