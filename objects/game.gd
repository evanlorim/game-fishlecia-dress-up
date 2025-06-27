extends Node2D
class_name Game

var gameplay_area
var ui_sprite_selector

var option_dict = {
	"Hat" : ["hat"],
	"Hair": ["hair_top","hair_front","hair_back"],
	"Face": ["face"],
	"Left Ear": ["left_ear"],
	"Right Ear": ["right_ear"],
	"Top": ["top"],
	"Bottom": ["bottom"],
	"Footwear": ["footwear"],
	"Pose": ["pose"],
	"Background": ["background"],
}

var option_list = option_dict.keys()
var option_index = 0

func _ready() -> void:
	gameplay_area = get_node(^"CanvasLayer/GameplayArea")
	ui_sprite_selector = get_node(^"CanvasLayer/UISpriteSelector")
	ui_sprite_selector.top_changed.connect(increment_option)
	ui_sprite_selector.btm_changed.connect(increment_item)
	increment_option()
	increment_item()
	increment_pose()
	pass

func increment_option(i: int = 0) -> void:
	var min_index = 0
	var max_index = option_list.size()-1
	option_index+= i
	if option_index > max_index: option_index = min_index
	elif option_index < min_index: option_index = max_index
	ui_sprite_selector.set_top_text(option_list[option_index])
	increment_item()
	pass

func increment_item(i: int = 0) -> void:
	var option_name = option_list[option_index]
	var layer_name_list = option_dict[option_name]
	for layer_name in layer_name_list:
		var layer = gameplay_area[layer_name]
		layer.increment_col(i)
		if layer_name == "pose":
			increment_pose(i)
		pass
	toggle_hair_top()
	var layer_1 = gameplay_area[layer_name_list[0]]
	ui_sprite_selector.set_btm_text(layer_1.get_sprite_name())
	pass

func increment_pose(i: int = 0) -> void:
	var draw_order = gameplay_area.pose.get_draw_order()
	for n in draw_order.size():
		var layer = gameplay_area[draw_order[n]]
		layer.set_z_index(n)
	for option_name in option_list:
		var layer_name_list = option_dict[option_name]
		for layer_name in layer_name_list:
			if layer_name != "pose":
				var layer = gameplay_area[layer_name]
				layer.increment_row(i)
			pass
	pass

func toggle_hair_top() -> void:
	var hat_name = gameplay_area.hat.get_sprite_name()
	if hat_name == "None":
		gameplay_area.hair_top.show()
	else:
		gameplay_area.hair_top.hide()
	pass
