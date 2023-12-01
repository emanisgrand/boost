extends RigidBody3D
@export_range(750, 3000) var thrust:float = 1000
@export var torque:float = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrust)
	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torque * delta))
	
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torque * delta))


func _on_body_entered(body: Node) -> void:
	if "Goal" in body.get_groups():
		complete_level(body.file_path)
	if "Hazard" in body.get_groups():
		hazard_crash()

func hazard_crash() -> void:
	print("KABLOOEY!")
	get_tree().reload_current_scene()

func complete_level(next_level_file : String) -> void:
	get_tree().change_scene_to_file(next_level_file)
