extends Node2D

var orb_anim = false
@export var missile: PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("click"):
		orb_anim = true
		var inst = missile.instantiate()
		inst.position = get_parent().position
		inst.rotation = global_rotation
		
		inst.velocity = Vector2(200, 200)
		get_tree().get_root().get_node("World").add_child(inst)
		
	if orb_anim:
		$Sprite2D.start = lerp($Sprite2D.start, 10.0, 0.1)
		if $Sprite2D.start < 11:
			orb_anim = false
	else:
		$Sprite2D.start = lerp($Sprite2D.start, 30.0, 0.08)
