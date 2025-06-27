extends Node

var game: Game
var main_menu: MainMenu

func _ready() -> void:
	_load_main_menu()
	main_menu.anything_pressed.connect(_load_game)
	pass

func _load_main_menu() -> void:
	var main_menu_scene = load("res://objects/main_menu.tscn")
	main_menu = main_menu_scene.instantiate()
	add_child(main_menu)
	pass

func _load_game() -> void:
	main_menu.queue_free()
	var game_scene = load("res://objects/game.tscn")
	game = game_scene.instantiate()
	add_child(game)
	pass
		
