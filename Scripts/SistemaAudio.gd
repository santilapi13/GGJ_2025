extends Node

@export var maximo_reproductores : int = 10
@onready var reproductor_musica : AudioStreamPlayer2D = $Musica
var reproductores : Array = []

func _ready():
	var nodo_reproductores : Node = $Sonidos
	for i in range(maximo_reproductores):
		var reproductor = AudioStreamPlayer2D.new()
		nodo_reproductores.add_child(reproductor)
		reproductores.append(reproductor)

func reproducir_musica(sonido: AudioStream, loop: bool = true):
	reproductor_musica.stream = sonido
	reproductor_musica.loop = loop
	reproductor_musica.play()
	
func parar_musica():
	reproductor_musica.stop()
	
func reproducir_sonido(sonido: AudioStream, posicion: Vector2 = Vector2.ZERO):
	for reproductor in reproductores:
		if not reproductor.playing:
			reproductor.stream = sonido
			reproductor.global_position = posicion
			reproductor.play()
			return
			
func parar_todos():
	reproductor_musica.stop()
	for reproductor in reproductores:
		reproductor.stop()
