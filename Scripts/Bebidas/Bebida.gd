extends Node
class_name Bebida

@export var estado: EstadoBebida  #EstadoBebida
@export var codigo_animacion: String

@onready var controlador_bebidas = get_parent()
@onready var jugador: CharacterBody2D = controlador_bebidas.get_parent()
var icono : Texture

var textura_brazos : Texture

func _ready():
	textura_brazos = preload("res://Resources/Sprites/SoderoV1/Idle/idle brazo.png")

func prepararse():
	jugador.cambiar_brazos(textura_brazos)
	
func usar_poder():
	estado.activarse()

func descartarse():
	controlador_bebidas.descartar_bebida()

# TODO: Gestionar animaciones de las manos en base a la bebida actual.


func update(delta):
	pass
