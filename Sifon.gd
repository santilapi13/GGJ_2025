extends Bebida

var soda_restante: float

func prepararse():
	soda_restante = 100

func usar_poder():
	# TODO: Decrementar la soda restante en base al tiempo que estuvo pulsado el botón de usar poder.
	super().usar_poder()
