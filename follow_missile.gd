extends Node2D


var velocity = Vector2.ZERO
var die = false

func _process(delta):
	var target_angle = 0
	var save = rotation
	look_at(get_global_mouse_position())
	target_angle = rotation
	rotation = save
	
	rotation = lerp(rotation, target_angle, 0.01)
	
	position.x += cos(rotation) * velocity.x * delta
	position.y += sin(rotation) * velocity.y * delta

	if die:
		modulate.a = lerp(modulate.a, 0.0, 0.03)
		if modulate.a < 0.05:
			queue_free()


func _on_area_2d_body_entered(body):
	if "dashing" not in body:
		velocity = Vector2.ZERO
		die = true
		$Area2D/CollisionPolygon2D.set_deferred('disabled', true)
