extends Control

var spell = 'magic missile'


func _ready():
	for i in $Panel/Icons.get_children():
		if i.name == spell:
			i.visible = true
		else:
			i.visible = false
