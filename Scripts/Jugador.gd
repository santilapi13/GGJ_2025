extends CharacterBody2D

@export var maquina_de_estados: Node
@export var controlador_de_bebidas: Node

func _physics_process(delta):
	if Input.is_action_just_pressed("power"):
		controlador_de_bebidas.usar_poder()
	
	maquina_de_estados.update_fisica(delta)
	move_and_slide()


func _process(delta):
	controlador_de_bebidas.update(delta)
