extends Bebida

const PREFAB_CORCHO: String = ""

func _ready():
	textura_brazos = preload("res://Resources/Sprites/SoderoV1/Correr/champ brazo.png")
	icono = preload("res://Resources/Sprites/champagne.png")
	pass

func descorchar():
	var prefab : Corcho = load(PREFAB_CORCHO).instantiate()
	add_child(prefab)
	prefab.global_position = jugador.global_position

func usar_poder():
	super()
	descartarse()
