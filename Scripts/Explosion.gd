extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("default")



func _on_animation_finished():
	get_parent().remove_child(self)
	self.queue_free()
