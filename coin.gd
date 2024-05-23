extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.dashing == true:
		Globals.gems += 1
	Globals.gems += 1
	$CoinGot.emitting = true
	$Sprite2D.modulate.a = 0.0
	$Area2D/CollisionPolygon2D.set_deferred('disabled', true)
	$CPUParticles2D.visible = false
	
	get_tree().create_timer(1).timeout.connect(func():
		queue_free())

