extends Bebida

const PREFAB_CORCHO: String = ""

func _ready():
	#textura_brazos = preload("")
	pass

func descorchar():
	var prefab : Corcho = load(PREFAB_CORCHO).instantiate()
	add_child(prefab)
	prefab.global_position = jugador.global_position

func usar_poder():
	super()
	descartarse()
