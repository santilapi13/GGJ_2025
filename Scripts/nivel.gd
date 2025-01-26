extends Node

@onready var punto_inicio : Marker2D = $PuntoInicio
@onready var punto_destino : Node = $PuntoDestino
@onready var jugador : CharacterBody2D = $Jugador

func _ready():
	jugador.global_position = punto_inicio.global_position

func llegar_a_destino(body):
	if body == jugador:
		SistemaJuego.siguiente_nivel()

func morir(body):
	if body == jugador:
		SistemaJuego.reiniciar_nivel()
