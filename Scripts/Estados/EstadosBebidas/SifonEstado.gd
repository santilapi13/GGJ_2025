extends EstadoBebida

@export var fuerza_de_salto = -100
@export var velocidad_maxima: float = 300.0

@export var estado_cayendo: Estado

func activarse():
	super()
 
func desactivarse():
	maquina_de_estados.cambiar_estado(estado_cayendo)

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	jugador.velocity.x = velocidad_maxima * eje_x
	
	if Input.is_action_pressed("power"):
		jugador.velocity.y = fuerza_de_salto
	else:
		maquina_de_estados.cambiar_estado(estado_cayendo)

