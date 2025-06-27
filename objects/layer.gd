extends Sprite2D
class_name Layer

@export var name_list: PackedStringArray
var sprite_row: int = 0
var sprite_col: int = 0

func increment_col(i: int = 0) -> void:
	var max_index = name_list.size()-1
	var min_index = 0
	sprite_col += i
	if sprite_col > max_index: sprite_col = min_index
	if sprite_col < min_index: sprite_col = max_index
	_set_region()
	pass

func increment_row(i: int = 0) -> void:
	var spritesheet_height = float(texture.get_height())
	var sprite_height = float(region_rect.size.y)
	var max_index = int(floor(spritesheet_height/sprite_height))-1
	var min_index = 0
	sprite_row += i

	if sprite_row > max_index: sprite_row = min_index
	if sprite_row < min_index: sprite_row = max_index
	_set_region()
	pass

func get_sprite_name() -> String:
	return name_list[sprite_col]

func _set_region() -> void:
	var new_sprite_offset_x = sprite_col * region_rect.size.x
	var new_sprite_offset_y = sprite_row * region_rect.size.y
	var new_sprite_position = Vector2(new_sprite_offset_x, new_sprite_offset_y)
	var sprite_size = Vector2(region_rect.size.x, region_rect.size.y)
	region_rect = Rect2(new_sprite_position, sprite_size)
	pass
