extends EstadoBebida

@export var fuerza_de_salto = 100.0

@export var estado_cayendo: Estado

func activarse():
	super()

func entrar():
	if jugador.rayB1.is_colliding() or jugador.rayB2.is_colliding():
		jugador.velocity.y  += -fuerza_de_salto * 2
		
	if jugador.rayA1.is_colliding() or jugador.rayA2.is_colliding():
		jugador.velocity.y  += fuerza_de_salto * 2
	
	if jugador.rayD1.is_colliding() or  jugador.rayD2.is_colliding() :
		jugador.velocity.x  += -fuerza_de_salto * 4
		
	if jugador.rayI1.is_colliding() or  jugador.rayI2.is_colliding():
		jugador.velocity.x  += fuerza_de_salto * 4
	
func update_fisica(delta):
	maquina_de_estados.cambiar_estado(estado_cayendo)

