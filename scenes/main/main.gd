extends Node2D
@export var player: Player

func _ready():
	var CONSUMABLE_PATH = "res://shared/consumables/consumable_test.tscn"
	var consumable_data = ResourceLoader.load(CONSUMABLE_PATH)
	var consumable = consumable_data.instantiate()
	
	var ARTIFACT_PATH = "res://shared/consumables/artifact.tscn"
	var artifact_data = ResourceLoader.load(ARTIFACT_PATH)
	var artifact = artifact_data.instantiate()
	
	var ENEMY_PATH = "res://shared/enemy/enemy.tscn"
	var enemy_data = ResourceLoader.load(ENEMY_PATH)
	var enemy = enemy_data.instantiate()
