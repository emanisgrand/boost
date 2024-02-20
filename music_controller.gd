extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func fade_in():
	# Fade in horns
	pass

func play_all():
	for child:AudioStreamPlayer in get_children():
		child.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
