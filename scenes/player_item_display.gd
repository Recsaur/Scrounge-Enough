extends Control
var PaintingDisp = preload("res://scenes/painting_display.tscn")
var CoindDisp = preload("res://scenes/coin.tscn")
var TVDisp = preload("res://scenes/tv_display.tscn")
var WashingDisp = preload("res://scenes/washing_display.tscn")

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(GameController.Carrying)
	pass

func ItemSpawn(Item):
	match Item:
		"Painting":
			print("Hi")
			var PD = PaintingDisp.instantiate()
			PD.position = Vector2(124,0)
			get_tree().current_scene.get_node("Player").get_node("CanvasLayer").add_child(PD)
			GameController.Carrying += PD.mass
		"Coin":
			print("Hi")
			var PD = CoindDisp.instantiate()
			PD.position = Vector2(124,0)
			get_tree().current_scene.get_node("Player").get_node("CanvasLayer").add_child(PD)
			GameController.Carrying += PD.mass
		"TV":
			print("Hi")
			var PD = TVDisp.instantiate()
			PD.position = Vector2(124,0)
			get_tree().current_scene.get_node("Player").get_node("CanvasLayer").add_child(PD)
			GameController.Carrying += PD.mass
		"Washing":
			print("Hi")
			var PD = WashingDisp.instantiate()
			PD.position = Vector2(124,0)
			get_tree().current_scene.get_node("Player").get_node("CanvasLayer").add_child(PD)
			GameController.Carrying += PD.mass
