extends Node2D

func _on_story_pressed():
	$Btn1.play()
	get_node("Back/MarginContainer/VB/Story").visible = true
	get_node("Back/MarginContainer/VB/Audio").visible = false
	get_node("Back/MarginContainer/VB/Art").visible = false

func _on_Home_pressed():
	$Btn1.play()
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	queue_free()
	get_tree().change_scene_to(load("res://Scenes/MainMenu.tscn"))

func _on_Audio_pressed():
	$Btn1.play()
	get_node("Back/MarginContainer/VB/Story").visible = false
	get_node("Back/MarginContainer/VB/Audio").visible = true
	get_node("Back/MarginContainer/VB/Art").visible = false


func _on_Art_pressed():
	$Btn1.play()
	get_node("Back/MarginContainer/VB/Story").visible = false
	get_node("Back/MarginContainer/VB/Audio").visible = false
	get_node("Back/MarginContainer/VB/Art").visible = true
