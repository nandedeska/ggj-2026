extends Control

const menu:PackedScene = preload("res://scenes/mainMenu.tscn")

# Starts up the timer
func _ready() -> void:
	$Timer.connect("timeout",playStart)
	$logoPlayer.connect("animation_finished",finishedAnim)

func playStart()->void:
	$logoPlayer.play("playLogo")

func finishedAnim(animName:StringName)->void:
	get_tree().change_scene_to_packed(menu)
