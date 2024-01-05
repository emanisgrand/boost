extends Node3D

var level_scene = preload("res://Levels/Level.tscn")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
