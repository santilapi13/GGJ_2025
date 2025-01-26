extends EstadoBebida

@export var fuerza_de_salto = 100.0

@export var estado_cayendo: Estado
@onready var cuerpo_completo: AnimatedSprite2D = $"../../Visuals/CuerpoCompleto"
@onready var cara: Sprite2D = $"../../Visuals/Cara"
@onready var brazo: Sprite2D = $"../../Visuals/Brazos"
@onready var cuerpo: Sprite2D = $"../../Visuals/Cuerpo"

func activarse():
	super()

func entrar():
	cara.visible = false
	cuerpo.visible = false
	brazo.visible = false
	cuerpo_completo.visible = true
	##cuerpo_completo.animation
	var eje_x =  sign(Input.get_axis("left","rigth"))
	var eje_y =  sign(Input.get_axis("up","down"))
	print(Vector2(eje_x,eje_y).normalized())
	jugador.velocity = Vector2(eje_x,eje_y).normalized() * fuerza_de_salto
	
	
func salir():
	cara.visible = true
	cuerpo.visible = true
	brazo.visible = true
	cuerpo_completo.visible = false

	
func update_fisica(delta):
	maquina_de_estados.cambiar_estado(estado_cayendo)
