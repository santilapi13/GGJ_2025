extends Estado

@export var estado_quieto: Estado
@export var estado_cayendo: Estado

@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 900.0

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	
	if eje_x != 0 and -sign(jugador.velocity.x) == eje_x:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, friccion * delta)
	elif eje_x != 0:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	elif abs(jugador.velocity.x) < 1.0:
		maquina_de_estados.cambiar_estado(estado_quieto)
	else:
		jugador.velocity.x = move_toward(jugador.velocity.x,0, friccion * delta)

	if not jugador.is_on_floor():
		maquina_de_estados.cambiar_estado(estado_cayendo)
