extends Node

@onready var cola_bebidas_hud = $"../HUD/ColaBebidasHUD"

enum Bebidas { SIN_BEBIDA, SIFON, GASEOSA, CHAMPAGNE, CERVEZA }

@onready var bebidas_posibles: Dictionary = {
	Bebidas.SIN_BEBIDA: $SinBebida, 
	Bebidas.SIFON: $Sifon,
	Bebidas.GASEOSA: $Gaseosa,
	Bebidas.CHAMPAGNE: $Champagne,
	Bebidas.CERVEZA: $Cerveza
}
var bebida_actual
var cola_bebidas: Array = []	# Referencias a las siguientes bebidas levantadas

func _ready():
	bebida_actual = bebidas_posibles[Bebidas.SIN_BEBIDA]

func usar_poder():
	bebida_actual.usar_poder()

func levantar_bebida(bebida: Bebidas):
	if bebida_actual == bebidas_posibles[Bebidas.SIN_BEBIDA]:
		SistemaAudio.reproducir_sonido("Soda")
		bebida_actual = bebidas_posibles[bebida]
		bebida_actual.prepararse()
	else:
		cola_bebidas.push_back(bebidas_posibles[bebida])
	
	actualizar_hud_cola()
	SistemaAudio.reproducir_sonido("Recoger")

func descartar_bebida():
	bebida_actual = bebidas_posibles[Bebidas.SIN_BEBIDA] if cola_bebidas.is_empty() else cola_bebidas.pop_front()
	bebida_actual.prepararse()
	actualizar_hud_cola()

func update(delta):
	bebida_actual.update(delta)

func crear_icono(bebida):
	var icono_bebida = TextureRect.new()
	icono_bebida.texture = bebida.icono
	icono_bebida.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	cola_bebidas_hud.add_child(icono_bebida)

func actualizar_hud_cola():
	for child in cola_bebidas_hud.get_children():
		child.queue_free()

	if bebida_actual != bebidas_posibles[Bebidas.SIN_BEBIDA]:
		crear_icono(bebida_actual)

	for bebida in cola_bebidas:
		crear_icono(bebida)
