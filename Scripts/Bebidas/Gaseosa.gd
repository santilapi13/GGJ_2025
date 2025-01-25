extends Bebida

var indice_esfervecencia: float
@export var efervecencia_maxima: float = 3000

func prepararse():
	indice_esfervecencia = 0
	super()

func usar_poder():
	super()
	##descartarse()

func update(delta):
	indice_esfervecencia += abs(jugador.velocity.x * 0.25 * delta)
	indice_esfervecencia += abs(jugador.velocity.y * 0.25 * delta)
# TODO: Incrementar indice de esfervecencia en base al movimiento brusco (esperar movimiento del jugador y eso)
