extends Node2D


var velocity = Vector2.ZERO
var die = false
var pass_wall = true
var follow_mouse = true
var sa = Vector2.ZERO

func _ready():
	sa = velocity

func _process(delta):
	if follow_mouse:
		var target_angle = 0
		var save = rotation
		look_at(get_global_mouse_position())
		target_angle = rotation
		rotation = save
		rotation = lerp(rotation, target_angle, 0.01)
	
	position.x += cos(rotation) * velocity.x * delta
	position.y += sin(rotation) * velocity.y * delta
	
	if pass_wall:
		if die :

			velocity = Vector2(lerp(velocity.x, 0.0, 0.03), lerp(velocity.y, 0.0, 0.03))
		else:
		
			velocity = Vector2(lerp(velocity.x, sa.x, 0.04), lerp(velocity.y, sa.y, 0.04))
	else:
		if die:
			modulate.a = lerp(modulate.a, 0.0, 0.05)
			if modulate.a < 0.05:
				queue_free()
			
	if velocity.x < 0.1 or velocity.y < 0.1:
		
		modulate.a = lerp(modulate.a, 0.0, 0.05)
		if modulate.a < 0.05:
			queue_free()
		
func _on_area_2d_body_entered(body):
	if "dashing" not in body:
		if pass_wall:
	
			modulate.a = 0.5
		else:
			velocity = Vector2.ZERO
		die = true
		sa = velocity

func _on_area_2d_body_exited(body):
	modulate.a = 1.0
	if pass_wall:
		die = false
