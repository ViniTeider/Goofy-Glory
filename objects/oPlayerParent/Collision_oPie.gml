if (other.owner != self && other.state == ARMA.THROWN && other.owner_id != id){
	hit(1);
	
	instance_destroy(other);
}




