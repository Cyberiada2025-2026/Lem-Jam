extends CharacterBody2D

var current_direction = "None"
var directions = ["Up", "Down", "Left", "Right"]
var canItMove:Array[bool] = [true, true, true, true]
var rng = RandomNumberGenerator.new()
var current_road = 0
var speed = 100

func choose_direction(sameOrNot: bool):
	current_road=0
	while true:
		var direction = rng.randi_range(0,3)
		if sameOrNot==true:
			if directions[direction] == current_direction:
				continue
		current_direction = directions[direction]
		break
	
	match current_direction:
		"Up":
			velocity=Vector2(0.0, -speed)
		"Down":
			velocity=Vector2(0.0, speed)
		"Left":
			velocity=Vector2(-speed, 0.0)
		"Right":
			velocity=Vector2(speed, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	choose_direction(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_road += delta * speed
	if move_and_slide()==true:
		choose_direction(true)
	elif rng.randf_range(0.0, 100.0) > 50 and current_road > 50:
			choose_direction(false)


func _on_body_entered(_body: Node) -> void:
	print("error") # Replace with function body.
