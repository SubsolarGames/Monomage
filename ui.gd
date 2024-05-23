extends CanvasLayer

@export var spell_icon: PackedScene
var spells = []
var selected = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("scroll_up"):
		Globals.selected += 1
		if Globals.selected >= len(Globals.spells):
			Globals.selected = 0
			
	if Input.is_action_just_pressed("scroll_down"):
		Globals.selected -= 1
		if Globals.selected < 0:
			Globals.selected = len(Globals.spells) - 1
			
		
	if Globals.spells != spells:

		spells = Globals.spells
		
		for i in $VBoxContainer/HBoxContainer/Spells.get_children():
			i.queue_free()
		
		var b = 0
		for i in Globals.spells:
			var inst = spell_icon.instantiate()
			inst.modulate.a = 0.3
			if b == Globals.selected:
		
				inst.modulate.a = 1
			inst.spell = i
			$VBoxContainer/HBoxContainer/Spells.add_child(inst)
		
			b += 1
			
	if Globals.selected != selected:
		
		selected = Globals.selected
		
		var b = 0
		for i in $VBoxContainer/HBoxContainer/Spells.get_children():
			i.modulate.a = 0.3
			if b == Globals.selected:
				
				i.modulate.a = 1
			b+=1
