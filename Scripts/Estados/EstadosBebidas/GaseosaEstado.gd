extends EstadoBebida

@export var fuerza_de_salto = 100.0

@export var estado_cayendo: Estado

@onready var cuerpo_completo: AnimatedSprite2D = $"../../Visuals/CuerpoCompleto"
@onready var cara: Sprite2D = $"../../Visuals/Cara"
@onready var brazo: Sprite2D = $"../../Visuals/Brazos"
@onready var cuerpo: Sprite2D = $"../../Visuals/Cuerpo"

func activarse():
	super()

func salir():
	cuerpo_completo.visible = false

func entrar():
	cuerpo_completo.visible = true
	##cuerpo_completo.animation

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

