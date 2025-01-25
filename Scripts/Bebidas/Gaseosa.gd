extends Bebida

var indice_esfervecencia: float

func prepararse():
	indice_esfervecencia = 0
	super().prepararse()
	
# TODO: Incrementar indice de esfervecencia en base al movimiento brusco (esperar movimiento del jugador y eso)
