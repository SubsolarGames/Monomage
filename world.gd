extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():

	$Player.position = $Start.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.position.y > 720:
		$Player.position = $Start.position
		Globals.health -= 20
