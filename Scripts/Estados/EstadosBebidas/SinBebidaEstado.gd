extends EstadoBebida

@export var fuerza_de_salto = 100
@export var gravedad: float = 600
@export var estado_cayendo: Estado

@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 900.0

func activarse():
	if not jugador.is_on_floor(): return
	super()

func entrar():
	jugador.velocity.y -= fuerza_de_salto

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	jugador.velocity.y += gravedad
	
	if eje_x != 0 and -sign(jugador.velocity.x) == eje_x:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, friccion * delta)
	elif eje_x != 0:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	else:
		jugador.velocity.x = move_toward(jugador.velocity.x,0, friccion * delta)
	
	if jugador.velocity.y >= 0: 
		maquina_de_estados.cambiar_estado(estado_cayendo)



