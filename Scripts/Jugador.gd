extends CharacterBody2D

@export var maquina_de_estados: Node


func _physics_process(delta):
	maquina_de_estados.update_fisica(delta)
	move_and_slide()
