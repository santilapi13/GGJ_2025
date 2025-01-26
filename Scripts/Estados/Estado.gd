extends Node
class_name Estado

var codigo_animacion: String = ""
var maquina_de_estados
var jugador: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	maquina_de_estados = get_parent()
	jugador = get_parent().get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update(delta):
	pass

func update_fisica(delta):
	pass

func entrar():
	if codigo_animacion != "":
		jugador.anim.play(codigo_animacion)

func salir():
	pass
