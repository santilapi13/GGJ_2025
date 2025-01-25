extends Bebida

@export var soda_maxima: float
var soda_restante: float = 2

func prepararse():
	soda_restante = soda_maxima
	super()

# TODO: Decrementar la soda restante en base al tiempo que estuvo pulsado el botón de usar poder (esperar movimiento del jugador y eso)
func update(delta):
	if Input.is_action_pressed("power"):
		soda_restante = soda_restante - delta
		if soda_restante < 0:
			descartarse()

func descartarse():
	estado.desactivarse()
	super()
