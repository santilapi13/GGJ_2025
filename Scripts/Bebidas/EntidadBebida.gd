extends Sprite2D

enum Bebidas { SIN_BEBIDA, SIFON, GASEOSA, CHAMPAGNE, CERVEZA }

@export var tipo_bebida: Bebidas
@onready var jugador : Node2D = $"../Jugador"

func _on_area_2d_body_entered(body):
	if body == jugador:
		jugador.levantar_bebida(tipo_bebida)
		queue_free()
