extends Node2D

func _on_jugar_pressed():
	SistemaJuego.comenzar_juego()

func _on_salir_pressed():
	get_tree().quit()
