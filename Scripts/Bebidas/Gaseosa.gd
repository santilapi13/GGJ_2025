extends Bebida

var indice_esfervecencia: float
@export var efervecencia_maxima: float = 3000

func prepararse():
	indice_esfervecencia = 0
	super()

func usar_poder():
	estado.fuerza_de_salto = indice_esfervecencia
	super()
	descartarse()

func update(delta):
	indice_esfervecencia += abs(jugador.velocity.x * 0.25 * delta)
	indice_esfervecencia += abs(jugador.velocity.y * 0.25 * delta)
	print(indice_esfervecencia)
	if indice_esfervecencia >= efervecencia_maxima:
		usar_poder()
# TODO: Incrementar indice de esfervecencia en base al movimiento brusco (esperar movimiento del jugador y eso)
