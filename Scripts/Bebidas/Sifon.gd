extends Bebida

@export var soda_maxima: float
var soda_restante: float = 2
var contador_musiquita: int = 0

func _ready():
	textura_brazos = preload("res://Resources/Sprites/Sodero/Correr/soda.png")
	icono = preload("res://Resources/Sprites/sifon.png")

func prepararse():
	soda_restante = soda_maxima
	super()

func update(delta):
	if Input.is_action_pressed("power"):
		soda_restante = soda_restante - delta
		if soda_restante < 0:
			descartarse()
	
	if Input.is_action_just_pressed("power"):
		if contador_musiquita == 0 or contador_musiquita == 1:
			SistemaAudio.reproducir_sonido("sifon_palmerasA")
		else:
			SistemaAudio.reproducir_sonido("sifon_palmerasB")
			if contador_musiquita == 3:
				contador_musiquita = -1
		contador_musiquita += 1
		SistemaAudio.reproducir_sonido("sifonazo")

func descartarse():
	estado.desactivarse()
	super()
