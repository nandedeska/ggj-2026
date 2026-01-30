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
		currentScene += 1
		$fade/fadeAnims.play("fadeIn")
		$cutsceneAnimator.play(cutscenesToPlay[currentScene])

func cutsceneFinish(animName:StringName)->void:
	if animName != "cutscene3":
		$fade/fadeAnims.play("fadeOut")
	else:
		print("enter game")
