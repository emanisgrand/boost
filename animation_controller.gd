extends Node3D

@onready var animation_tree:AnimationTree = $AnimationTree
@onready var playback:AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

# Called when the node enters the scene tree for the first time.
func _ready():
	playback.travel("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
