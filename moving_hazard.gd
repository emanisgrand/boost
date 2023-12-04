extends AnimatableBody3D

@export var destination:Vector3
@export var duration:float = 1.0
 
# I'm starting to worry if I'm running too many concurrent _process functioins.

func _ready():
	var tween = create_tween()
	tween.set_loops()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "global_position", global_position + destination, duration)
	tween.tween_property(self, "global_position", global_position, duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
