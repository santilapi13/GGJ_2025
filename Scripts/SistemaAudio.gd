extends Node

@export var maximo_reproductores : int = 10
var rutas_sfx : Dictionary = {
	# TODO: Poner pares "nombrePista": "rutaPista"
}
var rutas_musica : Dictionary = {
	"loop_juego": "res://Resources/Music/LOOP GAME.wav"
	# TODO: Poner pares "nombrePista": "rutaPista"
}
var pistas_sfx : Dictionary = {}
var pistas_musica : Dictionary = {}
@onready var reproductor_musica : AudioStreamPlayer2D = $ReproductorMusica
var reproductores : Array = []

func _ready():
	var nodo_reproductores : Node = $ReproductoresSFX
	for i in range(maximo_reproductores):
		var reproductor = AudioStreamPlayer2D.new()
		nodo_reproductores.add_child(reproductor)
		reproductores.append(reproductor)

	for ruta in rutas_musica:
		pistas_musica[ruta] = load(rutas_musica[ruta])
		
	for ruta in rutas_sfx:
		pistas_sfx[ruta] = load(rutas_sfx[ruta])

func reproducir_musica(pista: String):
	reproductor_musica.stream = pistas_musica[pista]
	reproductor_musica.play()

func parar_musica():
	reproductor_musica.stop()
	
func reproducir_sonido(sfx: String, posicion: Vector2 = Vector2.ZERO):
	for reproductor in reproductores:
		if not reproductor.playing:
			reproductor.stream = pistas_sfx[sfx]
			reproductor.global_position = posicion
			reproductor.play()
			return
			
func parar_todos():
	reproductor_musica.stop()
	for reproductor in reproductores:
		reproductor.stop()
