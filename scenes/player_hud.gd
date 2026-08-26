extends Control

@onready var RentTimer = $RentTimer
@onready var TimeLabel = $Time
@onready var GoalLabel = $Goal

@export var RandStrength: float = 1.0 
#@export var ShakeFade: float = 5.0

var ShakeStrength: float = GameController.PawShakes
@onready var paw1 = $RentTimer/PlayerItemDisplay/Sprite2D
@onready var paw2 = $RentTimer/PlayerItemDisplay/Sprite2D2
var paw1og:Vector2 = Vector2.ZERO
var paw2og:Vector2 = Vector2.ZERO


func _ready() -> void:
	paw1og = paw1.global_position
	paw2og = paw2.position

func _process(delta: float) -> void:
	ShakeStrength = GameController.PawShakes
	if ShakeStrength > 0.0:
		paw1.position = paw1og + Vector2(randf_range(-ShakeStrength,ShakeStrength),randf_range(-ShakeStrength,ShakeStrength))
		paw2.position = paw2og + Vector2(randf_range(-ShakeStrength,ShakeStrength),randf_range(-ShakeStrength,ShakeStrength))

	TimeLabel.text = str("%0.2f" % RentTimer.time_left)
	GoalLabel.text = "Rent: " + str(GameController.Money) + "/1000"
