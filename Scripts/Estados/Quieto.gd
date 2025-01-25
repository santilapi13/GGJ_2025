extends Estado

@export var estado_caminando: Estado

func update_fisica(delta):
	super(delta)
	if eje_x != 0:
		maquina_de_estados.cambiar_estado(estado_caminando)

func entrar():
	jugador.velocidad.x = 0
