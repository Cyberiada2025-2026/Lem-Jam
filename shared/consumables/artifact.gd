extends Area2D
var being_consumed: bool = false

func _on_body_entered(body: Player) -> void:
	if body and !being_consumed:
		being_consumed = true
		body.score += 10
		self.queue_free()
