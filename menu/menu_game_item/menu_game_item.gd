extends MarginContainer

@export var button : Button

var game_resoure : GameMenuSettings

signal game_selected(game_launch_resource)

static var a = 1

func _ready() -> void:
	button.text = str(a)
	a+=1
	button.icon = game_resoure.game_icon
	grab_focus.call_deferred()
	print(has_focus())
	

func set_game_resoure(game_resoure):
	self.game_resoure = game_resoure


func _on_button_pressed() -> void:	
	game_selected.emit(game_resoure)
