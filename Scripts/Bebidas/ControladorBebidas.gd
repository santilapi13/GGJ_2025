extends Node

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
	bebida_actual = bebidas_posibles[Bebidas.GASEOSA]

func usar_poder():
	bebida_actual.usar_poder()

func levantar_bebida(bebida: Bebida):
	if bebida_actual == bebidas_posibles[Bebidas.SIN_BEBIDA]:
		bebida_actual = bebida
		bebida_actual.prepararse()
	else:
		cola_bebidas.push_back(bebida)

func descartar_bebida():
	bebida_actual = bebidas_posibles[Bebidas.SIN_BEBIDA] if cola_bebidas.is_empty() else cola_bebidas.pop_front()
	bebida_actual.prepararse()

func update(delta):
	bebida_actual.update(delta)
