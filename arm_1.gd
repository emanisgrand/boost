extends Node3D
@onready var animation_player = $AnimationPlayer
@onready var physical_bone_00 = $"arm_skeleton/Skeleton3D/Physical Bone Bone_004"
@onready var skeleton_3d = $arm_skeleton/Skeleton3D
@onready var physical_bone = $"arm_skeleton/Skeleton3D/Physical Bone Bone_006"


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("armLoop")
	physical_bone.get_simulate_physics()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
