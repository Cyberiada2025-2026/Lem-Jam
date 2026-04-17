class_name PixelCollision
extends Node

@export var noise: Sprite2D
@export var character: Sprite2D

func check_overlap() -> bool:
	var size = character.get_rect().size
	var img = noise.texture.get_image()
	
	for y in size.y:
		for x in size.x:
			var pixel = img.get_pixelv(character.position + character.get_rect().position + Vector2(x, y))
			if pixel == Color.WHITE && character.is_pixel_opaque(character.get_rect().position + Vector2(x, y)):
				return true

	return false

func _physics_process(_delta: float) -> void:
	if check_overlap():
		print("Damage!")
	else:
		print("Safe!")
