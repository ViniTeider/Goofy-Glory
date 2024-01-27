/// @desc Insert description here


// Checa se o player ta em contato, e também guarda a instancia do player q tá em cima;

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
}