extends Estado

@export var estado_quieto: Estado
@export var estado_caminando: Estado

@export var velocidad_maxima: float = 300.0
@export var gravedad: float = 600


func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	jugador.velocity.y += gravedad
	
	jugador.velocity.x = velocidad_maxima * eje_x
	
	if jugador.is_on_floor():
		if jugador.velocity.x:
			maquina_de_estados.cambiar_estado(estado_caminando)
		else:
			maquina_de_estados.cambiar_estado(estado_quieto)


func salir():
	jugador.velocity.y = 0
