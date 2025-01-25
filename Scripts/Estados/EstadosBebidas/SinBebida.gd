extends EstadoBebida

@export var fuerza_de_salto = 100
@export var velocidad_maxima: float = 300.0
@export var gravedad: float = 600
@export var estado_cayendo: Estado

func activarse():
	if not jugador.is_on_floor(): return
	super()

func entrar():
	jugador.velocity.y -= fuerza_de_salto

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	jugador.velocity.y += gravedad
	
	jugador.velocity.x = velocidad_maxima * eje_x
	
	if jugador.velocity.y >= 0: 
		maquina_de_estados.cambiar_estado(estado_cayendo)



