extends Control

var temporary_pts_A = 1

func _physics_process(delta):
	$LeftMenu/VB/point_label.text = str(GameData.total_pointsA)
	
	if GameData.total_pointsA >= 30:
		$LeftMenu/VB/HCristal/cristalL.text = str(GameData.cristals)
		$LeftMenu/VB/HCristal.visible = true
		$LeftMenu/VB/Title1.visible = true
		GameData.cristal_unlocked = true
	if GameData.total_pointsA >= 1000:
		$LeftMenu/VB/HSO/onixL.text = str(GameData.onixs)
		$LeftMenu/VB/HSO.visible = true
		$LeftMenu/VB/Title2.visible = true
		GameData.onix_unlocked = true
	if GameData.total_pointsA >= 20000:
		$LeftMenu/VB/HGel/gelL.text = str(GameData.gels)
		$LeftMenu/VB/HGel.visible = true
		$LeftMenu/VB/Title3.visible = true
		GameData.gel_unlocked = true
	
	###### upgrades UNLOCKER
	
	if GameData.clouds >= 100:
		get_node("ShopMenu/Back/VB/upgradesPanel/Page1/2extra/Button").disabled = false
	if GameData.meteor >= 500:
		get_node("ShopMenu/Back/VB/upgradesPanel/Page1/25extra/Button2").disabled = false
	if GameData.clouds >= 5000:
		get_node("ShopMenu/Back/VB/upgradesPanel/Page1/100extra/Button3").disabled = false
	
	
		###### AUTO CLICKER UNLOCKER
	
	if  GameData.meteor >= 100 and GameData.clouds >= 200:
		$ShopMenu/Back/VB/upgradesPanel/Page2/autoClick.disabled = false
	
	###### GAME WON CHECK
	
	if GameData.cristals >= 35000 and  GameData.clouds >= 35000 and GameData.onixs >= 10000 and GameData.meteor >= 10000 and GameData.gels >= 5000 and GameData.solar >= 5000:
		get_node("ShopMenu/Back/VB/goalPanel/EndGame").disabled = false
	

func _on_clickerA_pressed():
	$BtnA2.play()
	if GameData.dimensionA == true:
		GameData.total_pointsA += temporary_pts_A * GameData.click_multiplierA
	if GameData.cristal_unlocked == true:
		GameData.cristals += temporary_pts_A * GameData.click_multiplierA
	if GameData.onix_unlocked == true:
		GameData.onixs += temporary_pts_A * GameData.click_multiplierA
	if GameData.gel_unlocked == true:
		GameData.gels += temporary_pts_A * GameData.click_multiplierA

##########################################
##########      PAUSE CODE      ##########

func _on_Btn_Config_pressed():
	$BtnA1.play()
	$PauseMenu.visible = true
	$LeftMenu.visible = false
	$BlackExtra.visible = false

func _on_No_pressed():
	$PauseMenu.visible = false
	$LeftMenu.visible = true
	$BlackExtra.visible = true


func _on_Yes_pressed():
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene_to(load("res://Scenes/MainMenu.tscn"))


##########################################
##########   SHOP SYSTEM CODE   ##########


func _on_CloseP_pressed():
	$ShopMenu.visible = false


func _on_Btn_Shop_pressed():
	$BtnA1.play()
	$ShopMenu.visible = true
	$ShopMenu/Back/VB/progessPanel.visible = true
	$ShopMenu/Back/VB/upgradesPanel.visible = false
	$ShopMenu/Back/VB/goalPanel.visible = false

func _on_ProgressBtn_pressed():
	$ShopMenu/Back/VB/progessPanel.visible = true
	$ShopMenu/Back/VB/upgradesPanel.visible = false
	$ShopMenu/Back/VB/goalPanel.visible = false


func _on_UpgradeBtn_pressed():
	$ShopMenu/Back/VB/progessPanel.visible =  false
	$ShopMenu/Back/VB/upgradesPanel.visible = true
	$ShopMenu/Back/VB/goalPanel.visible = false


func _on_GoalBtn_pressed():
	$ShopMenu/Back/VB/progessPanel.visible =  false
	$ShopMenu/Back/VB/upgradesPanel.visible = false
	$ShopMenu/Back/VB/goalPanel.visible = true

func _on_next_pressed():
	$ShopMenu/Back/VB/upgradesPanel/Page1.visible = false
	$ShopMenu/Back/VB/upgradesPanel/Page2.visible = true


func _on_previous_pressed():
	$ShopMenu/Back/VB/upgradesPanel/Page1.visible = true
	$ShopMenu/Back/VB/upgradesPanel/Page2.visible = false


func _on_Auto_A_timeout():
	randomize()
	var points_range = [1,2,3,4,5,10] ##Low points on purpose
	var random_point = points_range[randi() % points_range.size()]
	
	GameData.total_pointsA += random_point
	GameData.cristals += random_point
	GameData.onixs += random_point
	GameData.gels += random_point
	


func _on_autoClick_pressed():
	$BtnA1.play()
	$Auto_A.start()
	print("activated cliker")

func _on_Button_pressed():
	$BtnA2.play()
	GameData.click_multiplierA = 5

func _on_Button2_pressed():
	$BtnA2.play()
	GameData.click_multiplierA = 25


func _on_Button3_pressed():
	$BtnA2.play()
	GameData.click_multiplierA = 250


func _on_EndGame_pressed():
	$TransitionScreen.transition()
	yield(get_tree().create_timer(1),"timeout")
	queue_free()
	get_tree().change_scene_to(load("res://Scenes/GameWon.tscn"))
