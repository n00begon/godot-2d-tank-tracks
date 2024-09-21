class_name SpriteTank
extends CharacterBody2D

@export var gap: float = 48 #64 Full step 32 Half Step
var moveDistance: float = 0
var trackResource: PackedScene = preload("res://Scenes/SpriteMode/SpriteTrack.tscn")
var tracks: Array[SpriteTrack] = []
var current: int = 0

# From https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/index.html
var speed: float = 200  # move speed in pixels/sec
var rotation_speed: float = 2  # turning speed in radians/sec

func _ready() -> void:
	for i: int in range(200):
		var track: SpriteTrack = trackResource.instantiate()
		tracks.append(track)
		# Add the tracks to the root so they don't move with the tank
		get_tree().root.add_child.call_deferred(track)

func _physics_process(delta: float) -> void:
	var move_input: float = Input.get_axis("move_back", "move_forward")
	var rotation_direction: float = Input.get_axis("turn_left", "turn_right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	var _collide: bool = move_and_slide()
	moved(velocity.length() * delta)

func moved(distance: float) -> void:
	moveDistance += distance
	if moveDistance > gap:
		moveDistance -= gap
		place()

func place() -> void:
	tracks[current].place(get_global_transform())
	current = (current + 1) % tracks.size()

func _exit_tree() -> void:
	# Free all the tracks which have the root parent
	for i: int in range(tracks.size()):
		tracks[i].queue_free()
