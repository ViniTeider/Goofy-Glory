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
											// Cara de quem foi a ideia de colocar self.name
											// coisa do chico certeza kkkkkkkkkk
	show_debug_message($"Action for object: {object_get_name(object_index)}")
};