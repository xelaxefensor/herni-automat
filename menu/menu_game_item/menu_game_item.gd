extends MarginContainer

@export var label : Label
@export var button : Button

var game_resoure : GameMenuSettings

signal game_selected(game_launch_resource)


func _ready() -> void:
	label.text = game_resoure.game_name
	button.icon = game_resoure.game_icon
	

func set_game_resoure(game_resoure):
	self.game_resoure = game_resoure


func _on_button_pressed() -> void:	
	game_selected.emit(game_resoure)
