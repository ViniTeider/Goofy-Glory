/// @desc Declaração de coisas

// Variaveis de sprites
idle_sprite = sPlayer1Idle;
moving_sprite = sPlayer1Running;

// Weapon que está sendo usada
weapon = noone;

multiplier = global.time_on_screen / 1800;

// Variaveis de botões a serem apertados
left_key = noone;
right_key = noone;
up_key = noone;
down_key = noone;

pick_key = noone;
action_key = noone;

myColor = COLOR.BLUE;

pick_keyy = noone;
action_keyy = noone;

// Variaveis de velocidade / vida
vsp = 0; // Vertical speed
hsp = 0; // Horizontal speed
spd = 7; // Speed

// Variaveis de estado (n sei como chamar)
state = PLAYER.NORMAL;
knockback_cooldown = 30;

// Variaveis referentes ao controle
gp_index = noone;
controller_color = noone;
has_controller= noone;

pied = false;
pie = noone;

// Função de knockback (é chamada quando o player colide)
function knockback(distancia, direcao) {
	// TODO: Arrumar para ir mais rapido e menos longe?

	// ScreenShake
	screenshake(05, 3.5, 0.2);

	// Alteração das variaveis
    hsp = lengthdir_x(distancia, direcao);
    vsp = lengthdir_y(distancia, direcao);
    state = PLAYER.STUNNED;
    knockback_cooldown = 60
}

function hit(dano) {
	
	alarm[1] = 300;
	
	audio_play_sound(garagalhadas_ggjcwb,0,false,1,0);
	
	if(pied) {
		pied = false
		instance_destroy(pie);
		pie = noone;
	}
	
	oKing.laugh_time = 60;
	
	switch myColor {
		case COLOR.BLUE:
			global.risometro_laranja += dano// * (1 + multiplier * 2);
			moveDir = -1
			global.risometro_azul = max(0, global.risometro_azul - (dano*(0.5 - 0.3 * multiplier)));
			break;
		case COLOR.ORANGE:
			global.risometro_azul += dano// * (1 + multiplier * 2);
			moveDir = 1
			global.risometro_laranja = max(0, global.risometro_laranja - (dano*(0.5 - 0.3 * multiplier)))
			break;
	}

	with(instance_create_layer(oKing.x, oKing.y + 20, "Instances", oLaught)) {
		moveDir = other.moveDir
	}
}

// ON START
with instance_create_layer(x, y, "Instances", oPunchGun) {
	other.weapon = self;
	state = ARMA.OWNED;
	owner = other;
}