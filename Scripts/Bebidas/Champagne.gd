extends Bebida

const PREFAB_CORCHO: String = ""

func descorchar():
	var prefab : Corcho = load(PREFAB_CORCHO).instantiate()
	add_child(prefab)
	prefab.global_position = jugador.global_position
