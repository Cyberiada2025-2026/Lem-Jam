extends Node

var game_pause = false

func pause_game():
	game_pause = true
	get_child(0).visible = true
	get_tree().paused = true
	
func unpause_game():
	game_pause = false
	get_child(0).visible = false
	get_tree().paused = false
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if game_pause:
			unpause_game()
		else:
			pause_game()


func _on_return_button_pressed() -> void:
	unpause_game() # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().quit() # Replace with function body.
