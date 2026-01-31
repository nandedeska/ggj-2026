extends Node2D

# Fades screen out and plays constant menu movement
func _ready() -> void:
	$transitionHandler.connect("animation_finished",startMenu)
	$transitionHandler.play("masking")

func startMenu(animName:StringName)->void:
	if animName == "masking":
		$actualUI/play.connect("pressed",playGame)
		$actualUI/credits.connect("pressed",showCredits)

func playGame()->void:
	var scene:PackedScene = load("res://scenes/openingCutscene.tscn")
	get_tree().change_scene_to_packed(scene)

func showCredits()->void:
	print("----------")
	print("Magus Bautista - Programmer")
	print("Miguel Visqueraz - Programmer")
	print("Prinz Lim - Programmer")
	print("Samuel Arboleda - Programmer")
	print("Mira Paglinawan - Artist")
	print("Robyn Ballon - Artist")
	print("----------")
