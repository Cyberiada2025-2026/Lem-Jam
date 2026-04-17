extends CharacterBody2D
class_name Player
var time: float = 0
var score: int = 0
@export var speed = 200
@export var health_component: HealthComponent
var selected = false
var can_be_detected: = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_pickable = true
	input_event.connect(_on_character_input_event)


func _on_character_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("select_player"):
		if selected == false:
			selected = true	
		else:
			selected = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	print("Time:", time)
	if selected == true:
		var dir = position.direction_to(get_global_mouse_position())
		if abs(dir.normalized().x) > 0.2 and abs(dir.normalized().y) > 0.2:
			can_be_detected = true
		else:
			can_be_detected = false
			
		velocity = speed * dir.normalized()
		if position.distance_squared_to(get_global_mouse_position()) > 10:
			move_and_slide()
		else:
			can_be_detected = false
