extends Node

var can_execute:bool = true
var current_scene = null
var loading_scene = null
var loading_screen = preload("uid://d3s2rrc1ef2r1")


func _ready():
	current_scene = get_tree().current_scene


func goto_scene(path):
	print("LADOWANIE:" + str(current_scene))
	if can_execute:
		can_execute=false
		_deferred_goto_scene.call_deferred(path)


func _deferred_goto_scene(path):
	current_scene.free()

	ResourceLoader.load_threaded_request(path, "", true)
	loading_scene = loading_screen.instantiate()
	loading_scene.set_path(path)
	
	get_tree().root.add_child(loading_scene)
	get_tree().current_scene = loading_scene
	
	current_scene = await loading_scene.loaded_instance
	get_tree().root.add_child(current_scene)
	
	loading_scene.queue_free()
	get_tree().current_scene = current_scene	
	can_execute=true
