extends Node

var game_pause = false
var mouse_position:Vector2

func pause_game():
	mouse_position = get_viewport().get_mouse_position()
	get_viewport().warp_mouse(Vector2(320,240))
	game_pause = true
	get_child(0).visible = true
	get_tree().paused = true
	
func unpause_game():
	get_viewport().warp_mouse(mouse_position)
	game_pause = false
	get_child(0).visible = false
	get_tree().paused = false
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if game_pause:
			unpause_game()
		else:
			pause_game()


func _on_return_button_pressed() -> void:
	unpause_game() # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().quit() # Replace with function body.
