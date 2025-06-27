extends Layer
class_name PoseLayer

@export var draw_order_list: Array[PackedStringArray]
@export var disable_list_list: Array[PackedStringArray]

func get_draw_order() -> PackedStringArray:
	return draw_order_list[sprite_col]
