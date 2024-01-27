/// @desc Insert description here


// Checa se o player ta em contato, e também guarda a instancia do player q tá em cima;
player_contact = instance_place(x, y, oPlayerParent);


switch state {
	case ARMA.GROUND:
		with player_contact {
			if pick_key {
				other.state = ARMA.OWNED;
				other.owner = self;
			}
		}
		break;
		
	case ARMA.OWNED:
		x = owner.x;
		y = owner.y;
	
		image_angle = point_direction(0, 0, owner.hsp, owner.vsp);
	
		break;
}

	