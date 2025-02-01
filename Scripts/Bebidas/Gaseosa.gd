extends Bebida

var indice_esfervecencia: float
@export var efervecencia_maxima: float = 1000

func _ready():
	textura_brazos = preload("res://Resources/Sprites/Sodero/Correr/gaseosa brazo nuevo.png")
	icono = preload("res://Resources/Sprites/gaseosa.png")

func prepararse():
	indice_esfervecencia = 0
	super()

func usar_poder():
	estado.fuerza_de_salto = indice_esfervecencia
	super()
	descartarse()

func update(delta):
	indice_esfervecencia += abs(jugador.velocity.x * delta)
	indice_esfervecencia += abs(jugador.velocity.y * delta)
	if indice_esfervecencia >= efervecencia_maxima:
		usar_poder()
