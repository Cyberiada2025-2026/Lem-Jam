extends Node2D
var time_elapsed = 0
var rng = RandomNumberGenerator.new()

func add_consumables() -> void:
	
	var CONSUMABLE_PATH = "res://shared/consumables/consumable_test.tscn"
	var consumable_data = ResourceLoader.load(CONSUMABLE_PATH)
	
	var ARTIFACT_PATH = "res://shared/consumables/artifact.tscn"
	var artifact_data = ResourceLoader.load(ARTIFACT_PATH)
	
	var aoa = rng.randi_range(1, 10)
	for i in aoa:
		var x = rng.randi_range(30, 450)
		var y = rng.randi_range(30, 450)
		var artifact = artifact_data.instantiate()
		add_child(artifact)
		artifact.owner = get_tree().edited_scene_root
		artifact.position = Vector2(x,y)
		
		
	var aoc = rng.randi_range(3, 10)
	for i in aoc:
		var x = rng.randi_range(30, 450)
		var y = rng.randi_range(30, 450)
		var consumable = consumable_data.instantiate()
		add_child(consumable)
		consumable.owner = get_tree().edited_scene_root
		consumable.position = Vector2(x,y)
		
	
	
	
func add_enemies() -> void:
	var ENEMY_PATH = "res://shared/enemy/enemy.tscn"
	var enemy_data = ResourceLoader.load(ENEMY_PATH)
	var aoc = rng.randi_range(3,4 )
	for i in aoc:
		var x = rng.randi_range(175, 450)
		var y = rng.randi_range(175, 450)
		var enemy = enemy_data.instantiate()
		add_child(enemy)
		enemy.owner = get_tree().edited_scene_root
		enemy.position = Vector2(x,y)
	
	

func _ready():	
	add_consumables()
	await get_tree().create_timer(7).timeout
	add_enemies()
	
	


func _process(delta: float) -> void:
	time_elapsed += delta
	if time_elapsed > 10:
		time_elapsed = 0
		add_consumables()
		
