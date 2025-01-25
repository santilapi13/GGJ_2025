extends Estado

@export var estado_quieto: Estado

@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 1200.0

func update_fisica(delta):
	super(delta)
	if eje_x and eje_x == sign(jugador.velocity.x):
		jugador.velocity.x = lerp(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	elif eje_x:
		jugador.velocity.x = lerp(jugador.velocity.x, friccion * eje_x, aceleracion * delta)
	elif abs(jugador.velocity.x) < 0.10:
		maquina_de_estados.cambiar_estado(estado_quieto)
	else:
		jugador.velocity.x =lerp(jugador.velocity.x, 0.0, friccion * delta)
