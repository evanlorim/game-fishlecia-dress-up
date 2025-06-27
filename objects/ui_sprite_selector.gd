class_name UISpriteSelector
extends Control

signal top_changed(number)
signal btm_changed(number)
var top_label
var btm_label

func _ready() -> void:
	top_label = get_node(^"PanelContainer/MarginContainer/VBoxContainer/TopHBoxContainer/TopLabel")
	btm_label = get_node(^"PanelContainer/MarginContainer/VBoxContainer/BtmHBoxContainer/BtmLabel")
	pass

func _on_top_prev_button_pressed() -> void:
	top_changed.emit(-1)

func _on_top_next_button_pressed() -> void:
	top_changed.emit(1)

func _on_btm_prev_button_pressed() -> void:
	btm_changed.emit(-1)
	
func _on_btm_next_button_pressed() -> void:
	btm_changed.emit(1)

func set_top_text(text):
	top_label.text = text

func set_btm_text(text):
	btm_label.text = text
