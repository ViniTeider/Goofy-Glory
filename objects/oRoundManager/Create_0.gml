hasWinner = false

function winCutscene(looser) {
	var anvilX = looser.x;
	var anvilY = looser.y - 1000;
	
	looser.state = PLAYER.LOST;
	looser.sprite_index = looser.idle_sprite;
	
	instance_destroy(looser.weapon);
	looser.weapon = noone;
	
	anvil = instance_create_layer(anvilX, anvilY, "Instances", oAnvil);
	anvil.owner = looser;
	
	camera_set_view_target(view_camera[0], oAnvil);
	camera_set_view_size(view_camera[0], 576, 324);
	
	camera_set_view_border(view_camera[0], 288, 162);
	
	alarm[0] = 180;

}

function gameReset() {
	global.risometro_azul = 0
	global.risometro_laranja = 0
	audio_stop_sound(GOOFY_GLORY_Theme4k)
	room_goto_next()
}