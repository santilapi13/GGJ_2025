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
	jugador = maquina_de_estados.jugador

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	pass

func update_fisica(delta):
	eje_x = Input.get_axis("left","rigth")
	eje_y = Input.get_axis("up","down")

func entrar():
	pass

func salir():
	pass
