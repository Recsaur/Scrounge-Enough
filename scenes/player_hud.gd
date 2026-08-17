extends Control

@onready var RentTimer = $RentTimer
@onready var TimeLabel = $Time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	TimeLabel.text = str("%0.2f" % RentTimer.time_left)
