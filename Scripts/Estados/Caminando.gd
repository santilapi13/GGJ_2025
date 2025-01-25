extends Estado

@export var estado_quieto: Estado
@export var estado_cayendo: Estado

@export var velocidad_maxima: float = 300.0

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	
	jugador.velocity.x = velocidad_maxima * eje_x
	if jugador.velocity.x == 0:
		maquina_de_estados.cambiar_estado(estado_quieto)

	if not jugador.is_on_floor():
		maquina_de_estados.cambiar_estado(estado_cayendo)
