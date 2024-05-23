extends Node2D


var velocity = Vector2.ZERO
var die = false
var sa = Vector2.ZERO

func _ready():
	sa = velocity

func _process(delta):
	
	position.x += cos(rotation) * velocity.x * delta
	position.y += sin(rotation) * velocity.y * delta
	
	if die:

		velocity = Vector2(lerp(velocity.x, 0.0, 0.03), lerp(velocity.y, 0.0, 0.03))
	else:
	
		velocity = Vector2(lerp(velocity.x, sa.x, 0.04), lerp(velocity.y, sa.y, 0.04))
	
	if velocity.x < 0.1 or velocity.y < 0.1:
		modulate.a = lerp(modulate.a, 0.0, 0.05)
		if modulate.a < 0.05:
			queue_free()
		
func _on_area_2d_body_entered(body):
	if "dashing" not in body:
		modulate.a = 0.5
		die = true
		sa = velocity

func _on_area_2d_body_exited(body):
	modulate.a = 1.0
	die = false
