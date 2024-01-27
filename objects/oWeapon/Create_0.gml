/// @desc Insert description here

enum ARMA {
	GROUND, // 0
	OWNED // 1
}
	

state = ARMA.GROUND;

player_contact = noone;

//tanocahoum
on_ground = true;

//dono da arma
owner = noone;


// Fucao paa a arma fazx popo
function action() {
	show_debug_message($"Action for object: {self.name}")
};