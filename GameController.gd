extends Node

signal Action(value : float)

#PLAYER RELATED STUFF
var PlayerSpeed = 1000.0

#UI RELATED STUFF
var Money = 0
var PawShakes = 0
var Carrying = 0

#WORLD RELATED STUFF
var DrawerTime = 2
var PaintingTime = 0.25
var ClosetTime = 0.25
var CupboardTime = 2
var SinkTime = 0.25
var ClothesTime = 1
var VaseTime = 1
var TVTime = 3

func _process(delta: float) -> void:
	if Carrying > 1:
		PawShakes = 1
		PlayerSpeed = 900
	elif Carrying > 3:
		PawShakes = 2
		PlayerSpeed = 800
	elif Carrying > 5:
		PawShakes = 3
		print("HGGGGGGGG")
		PlayerSpeed = 700
	elif Carrying > 7:
		PawShakes = 4
		PlayerSpeed = 600
		
