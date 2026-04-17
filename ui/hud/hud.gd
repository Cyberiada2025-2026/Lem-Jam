extends Control

var player: Node
var time: Node
var score: Node
var health: Node
var health_bar: Node
var health_scale: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	health = player.get_node("HealthComponent")
	health_scale = 100 / health.max_health
	health_bar = get_node("VBoxContainer/Control2/TextureRect/ColorRect")
	score = get_node("VBoxContainer/Control3/Control/RichTextLabel3")
	time = get_node("VBoxContainer/Control4/Control/RichTextLabel3")

func _process(delta: float) -> void:
	health_bar.x = health_scale * health.health
	score.set_text(player.score)
	time.set_text(player.time)
