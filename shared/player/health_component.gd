extends Node
class_name HealthComponent
@export var max_health: int = 200
@export var regeneration_speed: float = 0.5
@export var health: float = 100.0
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func takeDamage(damage: float) -> void:
	health -= damage
	if health <= 0.0:
		get_parent().queue_free()


func heal(amount: float) -> void:
	health = max(health, health+amount)


func _process(delta: float) -> void:
	time += delta
	if time > regeneration_speed:
		time = 0
		if health < max_health:
			heal(1)
	
