extends Area2D
var being_consumed: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player and !being_consumed:
		being_consumed = true
		body.health_component.heal(20)
		self.queue_free()
