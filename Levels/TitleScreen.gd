extends MarginContainer

var level_scene = preload("res://Levels/Level.tscn")

func _on_button_button_down():
	get_tree().change_scene_to_packed(level_scene)

func _on_button_2_button_down():
	get_tree().quit()
