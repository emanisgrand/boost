extends RigidBody3D

@export_range(750, 3000) var thrust:float = 1000
@export var torque:float = 100
# flag state of tween
var is_transitioning:bool = false
#🩻️
@onready var general_skeleton: Skeleton3D = $Racer/RacerArmature/GeneralSkeleton
@onready var animation_tree:AnimationTree = $Racer/AnimationTree
@onready var playback:AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
#⚛️
@onready var explosion_particles:GPUParticles3D = $ExplosionParticles
@onready var booster_particles:GPUParticles3D = $BoosterParticles
@onready var success_particles:GPUParticles3D = $SuccessParticles
#🔊️
@onready var explosion_audio: AudioStreamPlayer = $ExplosionAudio
@onready var success_audio: AudioStreamPlayer = $SuccessAudio
@onready var rocket_audio: AudioStreamPlayer3D = $RocketAudio

func _ready():
	playback.travel("Idle")
	pass

func _process(delta):
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrust)
		booster_particles.emitting = true
		playback.travel("Flying")
		rocket_audio.stream_paused = false
		if rocket_audio.playing == false:
			rocket_audio.play()
	else:
		booster_particles.emitting = false
		rocket_audio.stream_paused = true
		
	if Input.is_action_just_released("boost"):
		playback.travel("Falling")
	
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torque * delta))

	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torque * delta))

	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_body_entered(body: Node) -> void:
	if is_transitioning == false:
		if "Goal" in body.get_groups():
			complete_level(body.file_path)
		if "Hazard" in body.get_groups():
			hazard_crash()

func hazard_crash() -> void:
	print("KABLOOEY!")
	Engine.time_scale = 0.4
	general_skeleton.physical_bones_start_simulation()
	explosion_audio.play(2.5)
	explosion_particles.emitting = true
	booster_particles.emitting = false
	set_process(false)
	is_transitioning = true
	# Now the tween takes over.
	var tween = create_tween()
	tween.tween_interval(2.0)
	tween.tween_callback(reset_time_scale)
	tween.tween_callback(get_tree().reload_current_scene)

func reset_time_scale() -> void:
	Engine.time_scale = 1.0

func complete_level(next_level_file : String) -> void:
	print("Level Complete!")
	#playback.travel("HardLand")
	success_audio.play()
	success_particles.emitting = true
	# I should definitely optimize this...or try at least.
	var tween = create_tween()
	set_process(false)
	is_transitioning = true
	# Now the tween takes over.
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file)) 
	
