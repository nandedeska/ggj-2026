extends Node2D

var currentLevel
var nextLevel
var x:float = 0

func _ready() -> void:
	currentLevel = get_tree().get_current_scene().get_name()
	match currentLevel:
		"ONE":
			x = 0
			nextLevel = "res://scenes/LEVEL_TWO.tscn"
		"TWO":
			x = 90
			print (x)
			nextLevel = "res://scenes/LEVEL_THREE.tscn"
		"THREE":
			nextLevel = "res://scenes/LEVEL_ONE.tscn"
	$Path2D.rotation_degrees = x

func _on_path_follow_2d_next_level() -> void:
	get_tree().change_scene_to_file(nextLevel)
