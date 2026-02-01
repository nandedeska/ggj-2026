extends Node2D

var currentLevel
var nextLevel

func _ready() -> void:
	currentLevel = get_tree().get_current_scene().get_name()
	match currentLevel:
		"levelOne":
			nextLevel = "res://scenes/LEVEL_TWO.tscn"
		"levelTwo":
			nextLevel = "res://scenes/LEVEL_THREE.tscn"
		"LevelThree":
			nextLevel = "res://scenes/LEVEL_ONE.tscn"
			
func _on_path_follow_2d_next_level() -> void:
	get_tree().change_scene_to_file(nextLevel)
