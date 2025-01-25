extends EstadoBebida

@export var fuerza_de_salto = 100.0
@export var velocidad_maxima: float = 300.0
@export var gravedad: float = 600.0

@export var estado_cayendo: Estado

func activarse():
	super()

func entrar():
	if jugador.rayB1.is_colliding() or jugador.rayB2.is_colliding():
		jugador.velocity.y  += -fuerza_de_salto
		
	if jugador.rayA1.is_colliding() or jugador.rayA2.is_colliding():
		jugador.velocity.y  += fuerza_de_salto
	
	if jugador.rayD1.is_colliding() or  jugador.rayD2.is_colliding() :
		jugador.velocity.x  += -fuerza_de_salto
		
	if jugador.rayI1.is_colliding() or  jugador.rayI2.is_colliding():
		jugador.velocity.x  += fuerza_de_salto
	

func update_fisica(delta):
	jugador.velocity.y += gravedad
	
	if jugador.velocity.y >= 0: 
		maquina_de_estados.cambiar_estado(estado_cayendo)
