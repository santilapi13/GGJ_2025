extends Node

@export var estado_inicial: Estado
var jugador: CharacterBody2D

var estado_actual: Estado
var controlador_bebidas

# Called when the node enters the scene tree for the first time.
func _ready():
	jugador = get_parent()
	estado_actual = estado_inicial
	estado_actual.entrar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func cambiar_estado(nuevo_estado: Estado):
	if estado_actual == nuevo_estado:
		return
	estado_actual.salir()
	estado_actual = nuevo_estado
	estado_actual.entrar()
	

