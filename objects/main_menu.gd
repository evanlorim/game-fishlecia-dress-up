extends Node2D
class_name MainMenu

signal anything_pressed()
func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_anything_pressed():
		anything_pressed.emit()
	pass
