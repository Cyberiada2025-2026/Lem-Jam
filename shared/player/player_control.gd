extends CharacterBody2D
class_name Player
var time: float = 0
var score: int = 0
var angle_control: float = 0.3
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
	if selected == true:
		var dir = global_position.direction_to(get_global_mouse_position())
		if abs(dir.normalized().x) > angle_control and abs(dir.normalized().y) > angle_control:
			can_be_detected = true
		else:
			can_be_detected = false
			
		velocity = speed * dir.normalized()
		if global_position.distance_squared_to(get_global_mouse_position()) > 10:
			move_and_slide()
		else:
			can_be_detected = false
