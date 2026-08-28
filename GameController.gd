extends Node

signal Action(value : float)

#PLAYER RELATED STUFF
var PlayerSpeed = 1000.0
var Interacting = false

var left = false
var right = false

#UI RELATED STUFF
var Money = 0
var PawShakes = 0
var Carrying = 0

#WORLD RELATED STUFF
var DrawerTime = 1.5
var PaintingTime = 0.25
var ClosetTime = 0.25
var CupboardTime = 2
var SinkTime = 0.25
var ClothesTime = 1
var VaseTime = 1
var TVTime = 2.5
var WashingTime = 3

func _process(delta: float) -> void:
	if not Interacting:
		if Carrying > 11:
			PawShakes = 6
			PlayerSpeed = 700
		if Carrying > 9:
			PawShakes = 5
			PlayerSpeed = 600
		if Carrying > 7:
			PawShakes = 4
			PlayerSpeed = 600
		elif Carrying > 5:
			PawShakes = 3
			PlayerSpeed = 700
		elif Carrying > 3:
			PawShakes = 2
			print("HGGGGGGGG")
			PlayerSpeed = 800
		elif Carrying > 1:
			PawShakes = 1
			PlayerSpeed = 900
		
