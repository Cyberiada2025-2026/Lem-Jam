extends CharacterBody2D
class_name Player
var time: float = 0
var score: int = 0
var angle_control: float = 0.01
@export var speed = 200
@export var health_component: HealthComponent
@export var visual: Sprite2D
var can_be_detected: = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	var dir = global_position.direction_to(get_global_mouse_position())
	if abs(dir.normalized().dot(Vector2(1, 1).normalized())) < angle_control or abs(dir.normalized().dot(Vector2(1, -1).normalized())) < angle_control:
		can_be_detected = true
		get_node("../../Camera2D/AnimationPlayer").play("camera_shake")
	else:
		can_be_detected = false
			
	velocity = speed * dir.normalized()
	visual.rotation = velocity.angle() + PI/2
	if global_position.distance_squared_to(get_global_mouse_position()) > 10:
		move_and_slide()
	else:
		can_be_detected = false

	if time > 60.0:
		SceneManager.goto_scene("ui/win_screen/win_screen.tscn")
