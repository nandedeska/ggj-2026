extends Node2D

const menu:PackedScene = preload("res://scenes/mainMenu.tscn")

# Starts up the timer
func _ready() -> void:
	$Timer.connect("timeout",startScreen)
	$AnimationPlayer.connect("animation_finished",finishedAnim)

func startScreen()->void:
	$AnimationPlayer.play("bounceIn")

func finishedAnim(animName:StringName)->void:
	if animName == "bounceIn":
		get_tree().change_scene_to_packed(menu)
