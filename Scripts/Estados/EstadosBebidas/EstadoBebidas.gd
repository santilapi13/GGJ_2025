extends Estado
class_name EstadoBebida

func activarse():
	maquina_de_estados.cambiar_estado(self)

func desactivarse():
	pass
