/// @desc Insert description here

switch state {
	case ARMA.GROUND:
		ground();
		break;
	case ARMA.OWNED:
		owned();
		break;
	case ARMA.THROWN:
		thrown();
		break;
	case ARMA.PIED:
		pie();
		break;
	case ARMA.SPAWN:
		spawn();
		break;
}