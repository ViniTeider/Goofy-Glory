/// @desc Insert description here

// Faz com que exista uma colisão com a parede
if place_meeting(x + hsp, y, oSolid) { // Checa colisao com a velocidade
	while(!place_meeting(x + sign(hsp), y, oSolid)) { // Repete até estar pixel a pixel com a parede
		x += sign(hsp);
	}	
	hsp = 0;
}

if place_meeting(x, y + vsp, oSolid) { // Checa colisao com a velocidade
	while(!place_meeting(x, y + sign(vsp), oSolid)) { // Repete até estar pixel a pixel com a parede
		y += sign(vsp);
	}	
	vsp = 0;
}
	
