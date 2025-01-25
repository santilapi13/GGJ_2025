extends CharacterBody2D

@onready var maquina_de_estados: Node = $MaquinaDeEstados
@onready var controlador_de_bebidas: Node = $ControladorBebidas

@onready var rayD1:RayCast2D = $Rays/RayCastD1
@onready var rayD2:RayCast2D = $Rays/RayCastD2
@onready var rayB1:RayCast2D = $Rays/RayCastB1
@onready var rayB2:RayCast2D = $Rays/RayCastB2
@onready var rayI1:RayCast2D = $Rays/RayCastI1
@onready var rayI2:RayCast2D = $Rays/RayCastI2
@onready var rayA1:RayCast2D = $Rays/RayCastA1
@onready var rayA2:RayCast2D = $Rays/RayCastA2

func _physics_process(delta):
	if Input.is_action_just_pressed("power"):
		controlador_de_bebidas.usar_poder()
	
	maquina_de_estados.update_fisica(delta)
	move_and_slide()


func _process(delta):
	controlador_de_bebidas.update(delta)
