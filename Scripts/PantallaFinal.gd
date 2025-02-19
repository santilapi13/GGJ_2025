extends Node2D

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		SistemaJuego.cargar_escena("res://Scenes/Menues/MenuPrincipal.tscn")
