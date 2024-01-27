/// @description 

owner_id = other.owner_id;

if destroy {
	instance_destroy();	
}

hit_instance = instance_place(x, y, oPlayerParent);

if hit_instance != noone { // se tivermos uma colisao
	if hit_instance.id != owner_id { // se atingiu algo que nao é o dono
		// aqui a gente da o dano ou sei la o que
		destroy = true; // a bala se mata
	}
}


















