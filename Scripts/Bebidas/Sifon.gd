extends Bebida

@onready var jugador = get_parent().get_parent()
var soda_restante: float

func prepararse():
	soda_restante = 100
	super().prepararse()

func usar_poder():
	if soda_restante > 0:
		super().usar_poder()
	else:
		descartarse()

# TODO: Decrementar la soda restante en base al tiempo que estuvo pulsado el botón de usar poder (esperar movimiento del jugador y eso)
