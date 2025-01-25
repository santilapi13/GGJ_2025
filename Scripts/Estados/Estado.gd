extends Node
class_name Estado

@export var codigo_animacion: String = " "
var maquina_de_estados
var jugador: CharacterBody2D

var eje_x
var eje_y

# Called when the node enters the scene tree for the first time.
func _ready():
	maquina_de_estados = get_parent()
	jugador = get_parent().get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	pass

func update_fisica(delta):
	eje_x =  sign(Input.get_axis("left","rigth"))
	eje_y = sign(Input.get_axis("up","down"))

func entrar():
	pass

func salir():
	pass
