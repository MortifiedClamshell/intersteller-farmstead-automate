extends Control

var profit = 0

#Wheat variables
var wheat_amount = 1
var wheat_auto_cost = 30
var wheat_auto = 1

#Carrot variables
var carrot_button_cost = 25
var carrot_amount = 5
var carrot_auto_cost = 30
var carrot_auto = 1

#Beet variables
var beet_button_cost = 250
var beet_amount = 25

signal profit_changed

#Wheat
	
func _on_wheat_button_button_down() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)
	
func _on_wheat_ai_auto_pressed() -> void:
	if profit >= wheat_auto_cost:
		profit -= wheat_auto_cost
		emit_signal("profit_changed", profit)
		#$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatAIAuto.visible = false
		$CropsMenu/VBoxContainer/Wheat/WheatAuto/WheatAuto.visible = true
		$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.start(wheat_auto)
	else:
		pass
		
func _on_wheat_timer_timeout() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/WheatAuto/WheatTimer.start(wheat_auto)

#Carot
func _on_carrot_unlock_pressed() -> void:
	if profit >= carrot_button_cost:
		profit -= carrot_button_cost
		emit_signal("profit_changed", profit)
		$CropsMenu/VBoxContainer/Carrot/CarrotUnlock.disabled = true
		$CropsMenu/VBoxContainer/Carrot/CarrotUnlock.visible = false
		$CropsMenu/VBoxContainer/Carrot/CarrotButton.disabled = false
		$CropsMenu/VBoxContainer/Carrot/CarrotProfit.visible = true
		$AIUpgradesMenu/VBoxContainer/CarrotAuto.visible = true
	else:
		pass
		

func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)

func _on_carrot_ai_auto_pressed() -> void:
	if profit >= carrot_auto_cost:
		profit -= carrot_auto_cost
		emit_signal("profit_changed", profit)
		#$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotAIAuto.visible = false
		$CropsMenu/VBoxContainer/Carrot/CarrotAuto/CarrotAuto.visible = true
		$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer.start(wheat_auto)
	else:
		pass
	
func _on_carrot_timer_timeout() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)
	$AIUpgradesMenu/VBoxContainer/CarrotAuto/CarrotTimer.start(carrot_auto)

#Beet
func _on_beet_unlock_pressed() -> void:
	if profit >= beet_button_cost:
		profit -= beet_button_cost
		emit_signal("profit_changed", profit)
		$CropsMenu/VBoxContainer/Beet/BeetUnlock.disabled = true
		$CropsMenu/VBoxContainer/Beet/BeetUnlock.visible = false
		$CropsMenu/VBoxContainer/Beet/BeetButton.disabled = false
		$CropsMenu/VBoxContainer/Beet/BeetProfit.visible = true
	else:
		pass

func _on_beet_button_button_down() -> void:
	profit += beet_amount
	emit_signal("profit_changed", profit)
