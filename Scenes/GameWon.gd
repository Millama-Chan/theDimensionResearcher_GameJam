extends Node2D


func _ready():
	$won.play()
	GameData.total_pointsU = GameData.total_pointsA + GameData.total_pointsB
	get_node("B/VB/subScore").text = str(GameData.total_pointsU)

func _on_close_pressed():
	$Btn1.play()
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene_to(load("res://Scenes/MainMenu.tscn"))
