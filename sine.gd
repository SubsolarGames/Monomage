extends Node2D

@export var height: float
@export var speed: float
@export var x_too = false
@export var both = false
var start: float
var start2: float
var b = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if x_too:
		start = position.x
	elif both:
		start = position.x
		start2 = position.y
	else:
		start = position.y
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if x_too:
		position.x = ( sin(b) * height) + start 
	elif both:
		position.x = ( sin(b) * height) + start 
		position.y = ( sin(b) * height) + start
	else:
		position.y = ( sin(b) * height) + start 
	b += (1*speed) * delta 

	
