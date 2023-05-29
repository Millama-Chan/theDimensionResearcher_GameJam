extends Node2D

func _on_PlayGame_pressed():
	$Btn1.play()
	reset_data()
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	queue_free()
	get_tree().change_scene_to(load("res://Scenes/GameScene.tscn"))


func _on_HowToPlay_pressed():
	$Btn1.play()
	get_node("Background/HTP").visible = true


func _on_Credits_pressed():
	$Btn1.play()
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	queue_free()
	get_tree().change_scene_to(load("res://Scenes/Credits.tscn"))


func _on_Quit_pressed():
	$Btn1.play()
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	get_tree().quit()


func reset_data():
	GameData.on_dimension_A = true
	GameData.on_dimension_B = true

	GameData.total_pointsA = 0
	GameData.total_pointsB = 0

	GameData.total_pointsU = 0

	GameData.cristals = 0
	GameData.onixs = 0
	GameData.gels = 0

	GameData.clouds = 0
	GameData.meteor = 0
	GameData.solar = 0

	GameData.dimensionA = true
	GameData.dimensionB = true

	GameData.cristal_unlocked = false
	GameData.onix_unlocked = false
	GameData.gel_unlocked = false


	GameData.clouds_unlocked = false
	GameData.meteor_unlocked = false
	GameData.solar_unlocked = false

	GameData.click_multiplierA = 1
	GameData.click_multiplierB = 1


func _on_Close_pressed():
	get_node("Background/HTP").visible = false
