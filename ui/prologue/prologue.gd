extends Control

var text: RichTextLabel
var time = 7
var current_time = 0
var start_time = 3
var max_read_time = 10
var cur_page = 0

func get_next_text():
	text.get_parent().visible=false
	cur_page += 1
	if cur_page == 6:
		SceneManager.goto_scene("res://scenes/main/main.tscn")
	else:
		text = get_child(0).get_child(cur_page).get_child(1)
	current_time = 0
	text.get_parent().visible=true

func _input(event):
	if event is InputEventKey and event.pressed:
		if text.visible_ratio > 0.0 and text.visible_ratio < 1.0:
			text.visible_ratio = 1.0
		else:
			get_next_text()

func _ready() -> void:
	text = get_child(0).get_child(0).get_child(0)
	
func _process(delta: float) -> void:
	if cur_page == 0:
		text.visible_ratio += delta * 0.5
	else:
		text.visible_ratio += delta * (1.0/time)
		
	if cur_page < 5:
		current_time += delta
		if (cur_page == 0 && current_time > start_time) or current_time > max_read_time:
			get_next_text()
