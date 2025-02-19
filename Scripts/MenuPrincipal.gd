extends Node

@onready var btn_jugar = $Jugar
@onready var btn_salir = $Salir

@onready var jugar_anim = $JugarAnimation
@onready var salir_anim = $SalirAnimation

func _ready():
	jugar_anim.play("Idle")
	salir_anim.play("Idle")

func _on_BtnJugar_mouse_entered():
	jugar_anim.play("Hover")

func _on_BtnJugar_mouse_exited():
	jugar_anim.play("Idle")

func _on_BtnJugar_pressed():
	jugar_anim.play("Pressed")
	SistemaJuego.cargar_escena("res://Scenes/Menues/tutorial.tscn")

func _on_BtnSalir_mouse_entered():
	salir_anim.play("Hover")

func _on_BtnSalir_mouse_exited():
	salir_anim.play("Idle")

func _on_BtnSalir_pressed():
	salir_anim.play("Pressed")
	get_tree().quit()


