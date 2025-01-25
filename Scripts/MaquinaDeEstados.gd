extends Node

@export var estado_inicial: Estado
var jugador: CharacterBody2D

var estado_actual: Estado
var controlador_bebidas

# Called when the node enters the scene tree for the first time.
func _ready():
	jugador = get_parent()
	estado_actual = estado_inicial


func update(delta):
	if estado_actual:
		estado_actual.update(delta)

func update_fisica(delta):
	if estado_actual:
		estado_actual.update_fisica(delta)

func cambiar_estado(nuevo_estado: Estado):
	if estado_actual == nuevo_estado:
		return
	estado_actual.salir()
	estado_actual = nuevo_estado
	estado_actual.entrar()
	

