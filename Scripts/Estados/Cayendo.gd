extends Estado

@export var estado_quieto: Estado
@export var estado_caminando: Estado

@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 900.0

@export var gravedad: float = 600

func _ready():
	super()
	codigo_animacion = "Caer"

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	jugador.velocity.y += gravedad
	
	if eje_x != 0 and -sign(jugador.velocity.x) == eje_x:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, friccion * delta)
	elif eje_x != 0:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	else:
		jugador.velocity.x = move_toward(jugador.velocity.x,0, friccion * delta)
	
	if jugador.is_on_floor():
		if jugador.velocity.x:
			maquina_de_estados.cambiar_estado(estado_caminando)
		else:
			maquina_de_estados.cambiar_estado(estado_quieto)


func salir():
	jugador.velocity.y = 0
