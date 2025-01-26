extends EstadoBebida

@export var fuerza_de_salto = -100
@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 900.0

@export var estado_cayendo: Estado

@onready var cuerpo_completo: AnimatedSprite2D = $"../../Visuals/CuerpoCompleto"
@onready var cara: Sprite2D = $"../../Visuals/Cara"
@onready var brazo: Sprite2D = $"../../Visuals/Brazos"
@onready var cuerpo: Sprite2D = $"../../Visuals/Cuerpo"

func entrar():
	cara.visible = false
	cuerpo.visible = false
	brazo.visible = false
	cuerpo_completo.visible = true
	cuerpo_completo.play("soda")

func salir():
	cara.visible = true
	cuerpo.visible = true
	brazo.visible = true
	cuerpo_completo.stop()
	cuerpo_completo.visible = false

func activarse():
	super()
 
func desactivarse():
	maquina_de_estados.cambiar_estado(estado_cayendo)

func update_fisica(delta):
	var eje_x =  sign(Input.get_axis("left","rigth"))
	
	if eje_x != 0 and -sign(jugador.velocity.x) == eje_x:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, friccion * delta)
	elif eje_x != 0:
		jugador.velocity.x = move_toward(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	else:
		jugador.velocity.x = move_toward(jugador.velocity.x,0, friccion * delta)
	
	if Input.is_action_pressed("power"):
		jugador.velocity.y = move_toward(jugador.velocity.y,fuerza_de_salto, aceleracion * delta)
	else:
		maquina_de_estados.cambiar_estado(estado_cayendo)

