extends Control

func on_quit_button():
	get_tree().quit()

func on_main_menu_button():
	SceneManager.goto_scene("res://ui/main_menu/main_menu.tscn")

func on_play_again_button():
	SceneManager.goto_scene("res://scenes/main/main.tscn")
