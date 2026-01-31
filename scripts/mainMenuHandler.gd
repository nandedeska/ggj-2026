extends Node2D

# Fades screen out and plays constant menu movement
func _ready() -> void:
	$fade/fadeController.connect("animation_finished",fadeFinish)
	$fade/fadeController.play("fadeOut")
	$menuAnims.play("menuMovement")

# Once fade is finished, initialize buttons
func fadeFinish(animName:StringName)->void:
	$fade.visible = false
	$playButton.connect("pressed",playCutscene)
	$creditsButton.connect("pressed",creditsScreen)

func playCutscene()->void:
	var scene:PackedScene = load("res://scenes/openingCutscene.tscn")
	get_tree().change_scene_to_packed(scene)

func creditsScreen()->void:
	print('hey')
