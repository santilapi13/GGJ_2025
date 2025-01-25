extends Node
class_name Bebida

@export var estado: EstadoBebida  #EstadoBebida
@export var codigo_animacion: String

@onready var controlador_bebidas = get_parent()
@onready var jugador: CharacterBody2D = controlador_bebidas.get_parent() 

func prepararse():
	pass
	
func usar_poder():
	estado.activarse()

func descartarse():
	controlador_bebidas.descartar_bebida()

# TODO: Gestionar animaciones de las manos en base a la bebida actual.


func update(delta):
	pass
