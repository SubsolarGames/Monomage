extends ProgressBar


func _process(delta):
	value = lerp(value, Globals.health, 0.03)
