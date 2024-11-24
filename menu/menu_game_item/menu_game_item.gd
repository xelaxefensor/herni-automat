extends MarginContainer

@export var label : Label
@export var texture_react : TextureRect

var game_resoure : GameMenuSettings

signal game_selected(game_launch_resource)


func _ready() -> void:
	label.text = game_resoure.game_name
	texture_react.texture = game_resoure.game_icon
	

func set_game_resoure(game_resoure):
	self.game_resoure = game_resoure


func _on_button_pressed() -> void:	
	$VBoxContainer/MarginContainer3/Button.release_focus()
	game_selected.emit(game_resoure)
	print("abraka")
