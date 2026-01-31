extends Node2D

var cutscenesToPlay = [
	"cutscene1",
	"cutscene2",
	"cutscene3"
]

var currentScene: int = 0
func _ready() -> void:
	$Timer.connect("timeout",playCutscenes)

func playCutscenes()->void:
	$fade/fadeAnims.connect("animation_finished",fadeFinish)
	$cutsceneAnimator.connect("animation_finished",cutsceneFinish)
	$cutsceneAnimator.play(cutscenesToPlay[currentScene])
	$fade/fadeAnims.play("fadeIn")

func fadeFinish(animName:StringName)->void:
	if animName == "fadeOut":
		if currentScene != (cutscenesToPlay.size()-1):
			currentScene += 1
			$fade/fadeAnims.play("fadeIn")
			$cutsceneAnimator.play(cutscenesToPlay[currentScene])
		else:
			var scene:PackedScene = load("res://scenes/game.tscn")
			get_tree().change_scene_to_packed(scene)

func cutsceneFinish(animName:StringName)->void:
	$fade/fadeAnims.play("fadeOut")
