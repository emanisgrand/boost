extends Node3D
@onready var animation_player = $AnimationPlayer
@onready var skeleton_3d = $arm_skeleton/Skeleton3D


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("armLoop")
	#skeleton_3d.physical_bones_start_simulation()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
