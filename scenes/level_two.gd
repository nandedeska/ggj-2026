extends Node2D

var currentLevel
var nextLevel

func _ready() -> void:
	pass
	
func _on_path_follow_2d_next_level() -> void:
	Transitioner.transition()
	await Transitioner.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/LEVEL_THREE.tscn")
