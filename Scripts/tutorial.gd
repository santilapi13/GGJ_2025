extends Node2D

var imagenes_intro : Array = [
	"res://Resources/EscenasIntro/pantalla 2.jpg",
	"res://Resources/EscenasIntro/pantalla 3.jpg",
	"res://Resources/EscenasIntro/pantalla 4.jpg",
	"res://Resources/EscenasIntro/pantalla 5.jpg",
	"res://Resources/EscenasIntro/pantalla 6.jpg"
]

var texturas_intro : Array = []

@onready var imagen_fondo : Sprite2D = $ImagenFondo
@onready var boton_siguiente : Sprite2D = $BotonSiguiente
@onready var textura_boton_siguiente : Texture = load("res://Resources/EscenasIntro/boton siguiente.png")
@onready var textura_boton_comenzar : Texture = load("res://Resources/EscenasIntro/BOTON TUTO.png")

var pantalla_actual : int = 1
var anim : AnimationPlayer

func _ready():
	for imagen in imagenes_intro:
		texturas_intro.append(load(imagen))
	
	imagen_fondo.texture = texturas_intro[0]
	boton_siguiente.texture = textura_boton_siguiente
	anim = SistemaJuego.anim

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if pantalla_actual == len(texturas_intro):
			SistemaJuego.comenzar_juego()
		else:
			anim.play('mostrar')
			await anim.animation_finished
			imagen_fondo.texture = texturas_intro[pantalla_actual]
			pantalla_actual = pantalla_actual + 1
			if pantalla_actual == len(texturas_intro):
				boton_siguiente.texture = textura_boton_comenzar
				boton_siguiente.scale = Vector2(0.1, 0.1)
			anim.play_backwards('mostrar')
			await anim.animation_finished
