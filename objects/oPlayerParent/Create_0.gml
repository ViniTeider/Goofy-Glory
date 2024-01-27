/// @desc Declaração de coisas

// Variaveis de sprites
idle_sprite = sPlayer1Idle;
moving_sprite = sPlayer1Running;


// Weapon que está sendo usada
weapon = noone;

// Variaveis de botões a serem apertados
left_key = noone;
right_key = noone;
up_key = noone;
down_key = noone;

pick_key = noone;
action_key = noone;

pick_keyy = noone;
action_keyy = noone;

// Variaveis de velocidade / vida
vsp = 0; // Vertical speed
hsp = 0; // Horizontal speed
spd = 4; // Speed
hp = 10; // HP

// Variaveis de estado (n sei como chamar)
state = PLAYER.NORMAL;
knockback_cooldown = 60;

// Função de knockback (é chamada quando o player colide)
function knockback(distancia, direcao, dano, spd) {
	// TODO: Arrumar para ir mais rapido e menos longe?

	// ScreenShake
	screenshake(05, 2.5, 0.2);

	// Alteração das variaveis
    hp -= dano
    hsp = lengthdir_x(distancia, direcao) * spd;
    vsp = lengthdir_y(distancia, direcao) * spd;
    state = PLAYER.STUNNED;
    knockback_cooldown = 60
}