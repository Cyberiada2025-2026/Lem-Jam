class_name PixelCollision
extends Node

@export var damage_per_second: float = 50.0

@onready var noise: Sprite2D = $%Noise
@onready var character: Sprite2D = $%Player/Sprite2D
@onready var rect: Rect2 = character.get_rect()

func check_overlap() -> bool:
	var size = rect.size
	var img = noise.texture.get_image()

	var center = rect.size / 2
	
	for y in size.y:
		for x in size.x:
			var pixel = img.get_pixelv($%Player.position - center + Vector2(x, y))
			if pixel == Color.WHITE && character.is_pixel_opaque(rect.position + Vector2(x, y)):
				return true

	return false

func _physics_process(delta: float) -> void:
	if character == null:
		queue_free()
	elif check_overlap():
		$%Player/HealthComponent.takeDamage(delta * damage_per_second)
		print($%Player/HealthComponent.health)
