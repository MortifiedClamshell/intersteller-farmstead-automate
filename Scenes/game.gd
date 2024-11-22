extends Control

var profit = 0

#Wheat variables
var wheat_amount = 1
var wheat_auto_cost = 30
var wheat_auto = 1

#Carrot variables
var carrot_button_cost = 25
var carrot_amount = 5

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
		$Wheat/Control/WheatAIAuto.visible = false
		$Wheat/Control/WheatAuto.visible = true
		$Wheat/Control/WheatTimer.start(wheat_auto)
	else:
		pass
		
func _on_wheat_timer_timeout() -> void:
	profit += wheat_amount
	emit_signal("profit_changed", profit)
	$Wheat/Control/WheatTimer.start(wheat_auto)

#Carot
func _on_carrot_unlock_pressed() -> void:
	if profit >= carrot_button_cost:
		profit -= carrot_button_cost
		emit_signal("profit_changed", profit)
		$Carrot/CarrotUnlock.disabled = true
		$Carrot/CarrotUnlock.visible = false
		$Carrot/CarrotButton.disabled = false
		$Carrot/CarrotProfit.visible = true
	else:
		pass
		

func _on_carrot_button_button_down() -> void:
	profit += carrot_amount
	emit_signal("profit_changed", profit)
	
#Beet
func _on_beet_unlock_pressed() -> void:
	if profit >= beet_button_cost:
		profit -= beet_button_cost
		emit_signal("profit_changed", profit)
		$Beet/BeetUnlock.disabled = true
		$Beet/BeetUnlock.visible = false
		$Beet/BeetButton.disabled = false
		$Beet/BeetProfit.visible = true
	else:
		pass

func _on_beet_button_button_down() -> void:
	profit += beet_amount
	emit_signal("profit_changed", profit)
