extends EstadoBebida

@export var fuerza_de_salto = 100.0

@export var estado_cayendo: Estado
@onready var explosion = "res://Scenes/Explocion.tscn"

func activarse():
	super()


func entrar():
	var instance = load(explosion).instantiate()
	add_child(instance)
	instance.position = jugador.position
	SistemaAudio.reproducir_sonido("Explosion")
	
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

