extends Node2D

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		SistemaJuego.comenzar_juego()
