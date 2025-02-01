extends Node2D

func _on_jugar_pressed():
	SistemaJuego.cargar_escena("res://Scenes/Menues/tutorial.tscn")

func _on_salir_pressed():
	get_tree().quit()
