extends Node2D

var last = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Slam():
	$Slamdoor.play()
	
func Shaking():
	var pitchneed = 1
	if GameController.Carrying > 7:
		$shaking.pitch_scale  = 1.15
	elif GameController.Carrying > 5:
		$shaking.pitch_scale  = 1.1
	elif GameController.Carrying > 3:
		$shaking.pitch_scale  = 1.05
	if last != pitchneed:
		$shaking.pitch_scale = pitchneed
		last = pitchneed
		if $shaking.playing:
			$shaking.stop()
	if not $shaking.playing:
		$shaking.play()

func thud():
	$thud.play()

func removewashing():
	$Washingmachineremove.play()

func hit():
	$CardboardBoxesHitAndTumble1.play()

func Coin():
	$ThinMetalHit5.play()

func BG1():
	$Bg1.play()

func BG2():
	$Bg2.play()

func OpenDoor():
	$Opendoro.play()
