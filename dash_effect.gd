extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func die():
	queue_free()
