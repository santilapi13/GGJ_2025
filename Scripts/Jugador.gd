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
@onready var anim:AnimationPlayer = $Anim

func _ready():
	SistemaJuego.reiniciar.connect(reiniciar_nivel)

func _physics_process(delta):
	if Input.is_action_just_pressed("power"):
		controlador_de_bebidas.usar_poder()
	
	if velocity.x > 0:
		$Visuals.scale = Vector2(-1, 1)
	elif velocity.x < 0:
		$Visuals.scale = Vector2.ONE
	
	maquina_de_estados.update_fisica(delta)
	move_and_slide()


func _process(delta):
	controlador_de_bebidas.update(delta)
	
func levantar_bebida(bebida):
	controlador_de_bebidas.levantar_bebida(bebida)

func cambiar_brazos(sprite_brazos: Texture):
	$Visuals/Brazos.texture = sprite_brazos

func reiniciar_nivel():
	controlador_de_bebidas.reiniciar_nivel()
