extends Control

var temporary_pts_B = 1

func _physics_process(delta):
	$LeftMenu/VB/point_label.text = str(GameData.total_pointsB)
	
	if GameData.total_pointsB >= 30:
		$LeftMenu/VB/HCristal/cloudL.text = str(GameData.clouds)
		$LeftMenu/VB/HCristal.visible = true
		$LeftMenu/VB/Title1.visible = true
		GameData.clouds_unlocked = true
	if GameData.total_pointsB >= 500:
		$LeftMenu/VB/HSO/meteorL.text = str(GameData.meteor)
		$LeftMenu/VB/HSO.visible = true
		$LeftMenu/VB/Title2.visible = true
		GameData.meteor_unlocked = true
	if GameData.total_pointsB >= 10000:
		$LeftMenu/VB/HGel/solarL.text = str(GameData.solar)
		$LeftMenu/VB/HGel.visible = true
		$LeftMenu/VB/Title3.visible = true
		GameData.solar_unlocked = true
	
	###### upgrades UNLOCKER
	
	if GameData.cristals >= 100:
		get_node("ShopMenu/Back/VB/upgradesPanel/Page1/2extraB/ButtonB").disabled = false
	if GameData.onixs >= 500:
		get_node("ShopMenu/Back/VB/upgradesPanel/Page1/25extraB/Button2B").disabled = false
	if GameData.cristals >= 5000:
		get_node("ShopMenu/Back/VB/upgradesPanel/Page1/100extraB/Button3B").disabled = false
	
	###### AUTO CLICKER UNLOCKER
	
	if  GameData.onixs >= 100 and GameData.cristals >= 200:
		$ShopMenu/Back/VB/upgradesPanel/Page2/autoClickB.disabled = false
	
	###### GAME WON CHECK
	
	if GameData.cristals >= 35000 and  GameData.clouds >= 35000 and GameData.onixs >= 10000 and GameData.meteor >= 10000 and GameData.gels >= 5000 and GameData.solar >= 5000:
		get_node("ShopMenu/Back/VB/goalPanel/EndGame").disabled = false
	
	

func _on_clickerB_pressed():
	$BtnA2.play()
	if GameData.dimensionB == true:
		GameData.total_pointsB += temporary_pts_B * GameData.click_multiplierB
	if GameData.clouds_unlocked == true:
		GameData.clouds += temporary_pts_B * GameData.click_multiplierB
	if GameData.meteor_unlocked == true:
		GameData.meteor += temporary_pts_B * GameData.click_multiplierB
	if GameData.solar_unlocked == true:
		GameData.solar += temporary_pts_B * GameData.click_multiplierB

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
	

func _on_Button_pressed():
	GameData.click_multiplier = 2


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


func _on_Auto_B_timeout():
	randomize()
	var points_range = [1,2,3,4,5,10] ##Low points on purpose
	var random_point = points_range[randi() % points_range.size()]
	
	GameData.total_pointsB += random_point
	GameData.clouds += random_point
	GameData.meteor += random_point
	GameData.solar += random_point
	


func _on_autoClickB_pressed():
	$BtnA1.play()
	$Auto_B.start()
	print("activated cliker")



func _on_ButtonB_pressed():
	$BtnA2.play()
	GameData.click_multiplierB = 5


func _on_Button2B_pressed():
	$BtnA2.play()
	GameData.click_multiplierB = 25


func _on_Button3B_pressed():
	$BtnA2.play()
	GameData.click_multiplierB = 250

