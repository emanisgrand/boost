extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	for child:AudioStreamPlayer in get_children():
		child.play()

func fade_in():
	# Fade in horns
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
