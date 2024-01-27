/// @desc Insert description here

// Verifica se foi clicado alguma das teclas de movimentação
left_key = keyboard_check(left_keyy);
right_key = keyboard_check(right_keyy);
up_key = keyboard_check(up_keyy);
down_key = keyboard_check(down_keyy);


// Verifica se o botão das ações foi clicado
pick_key = keyboard_check_pressed(pick_keyy);
action_key = keyboard_check_pressed(action_keyy);


// muda o movimento caso o player esteja em estado estunado
switch state {
	case PLAYER.NORMAL:
		hsp = (right_key - left_key) * spd;
		vsp = (down_key - up_key) * spd;
		break;
	case PLAYER.STUNNED:
		 if knockback_cooldown > 0 { knockback_cooldown--; }
         else state = PLAYER.NORMAL
         break; 
}


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


x += hsp;
y += vsp;