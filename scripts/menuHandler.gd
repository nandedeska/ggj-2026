extends Node2D

# Fades screen out and plays constant menu movement
func _ready() -> void:
	$maskTransition.play("openUp")
	$mainTitle/play.connect("pressed",playCutscene)
	$mainTitle/credits.connect("pressed",openCredits)

func playCutscene()->void:
	var scene:PackedScene = load("res://scenes/openingCutscene.tscn")
	get_tree().change_scene_to_packed(scene)

func openCredits()->void:
	$mainTitle/AnimationPlayer.play("scroll")
