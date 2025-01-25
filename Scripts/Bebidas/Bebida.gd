extends Node
class_name Bebida

@export var estado: EstadoBebida  #EstadoBebida
@export var codigo_animacion: String

@onready var controlador_bebidas = get_parent()
var activa = false

func prepararse():
	activa = true

func usar_poder():
	estado.activarse()

func descartarse():
	activa = false
	controlador_bebidas.descartar_bebida()

# TODO: Gestionar animaciones de las manos en base a la bebida actual.
