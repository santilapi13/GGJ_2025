extends Bebida

@onready var jugador = get_parent().get_parent()
@export var soda_maxima: float
var soda_restante: float = 10

func prepararse():
	soda_restante = soda_maxima
	super().prepararse()

func usar_poder():
	if soda_restante > 0:
		super()
	else:
		descartarse()
		print("descarte")

# TODO: Decrementar la soda restante en base al tiempo que estuvo pulsado el botón de usar poder (esperar movimiento del jugador y eso)
func update(delta):
	if Input.is_action_pressed("power"):
		soda_restante = soda_restante - delta
	pass
