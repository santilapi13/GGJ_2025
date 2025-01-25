extends Estado

@export var estado_quieto: Estado
@export var estado_caminando: Estado

@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 1200.0
@export var gravedad: float = 600


func update_fisica(delta):
	super(delta)
	jugador.velocity.y += gravedad
	
	if eje_x != 0 and eje_x == sign(jugador.velocity.x):
		jugador.velocity.x = lerp(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	elif eje_x != 0:
		jugador.velocity.x = lerp(jugador.velocity.x, friccion * eje_x, aceleracion * delta)
	else:
		jugador.velocity.x =lerp(jugador.velocity.x, 0.0, friccion * delta)
	
	if jugador.is_on_floor():
		if jugador.velocity.x:
			maquina_de_estados.cambiar_estado(estado_caminando)
		else:
			maquina_de_estados.cambiar_estado(estado_quieto)


func salir():
	super()
	jugador.velocity.y = 0
