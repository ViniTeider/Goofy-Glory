/// @desc Insert description here

enum ARMA {
	GROUND, // 0
	OWNED, // 1
	THROWN // 2
}

// Stats das armas
cooldown_max = 60 // o jogo roda a 60 fps o step roda 60vezes por segundo
			  // então se a gente fizer cooldown-- vai demorar 60frames(1sec) pra ele zerar
			 // se quiser colocar qlr valor faz 60 * valor_segundos
			 
cooldown = cooldown_max
uses = 0;


state = ARMA.GROUND;
player_contact = noone;

//dono da arma
owner = noone;

// variaveis pra jogar a arma
angle = 0;
hsp = 0;
vsp = 0;
bounce = 0; // qtdes de bounces
			// qnd n tiver mais bounces a velocidade para da pra usar -1 como infinito.


// Executa quando os usos da arma acabam
function breakWeapon() {
	other.owner.image_angle = 0;
	state = ARMA.GROUND
	owner.weapon = noone;
	owner = noone;
	instance_destroy();
	return;
}



// Fucao paa a arma fazx popo
function action() {
	// Cara de quem foi a ideia de colocar self.na
	// coisa do chico certeza kkkkkkkkkk
	show_debug_message($"Action for object: {object_get_name(object_index)}")
};