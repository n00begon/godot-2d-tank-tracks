class_name GPUParticleTank
extends CharacterBody2D

const FLAG = 3 # emit_position and emit_rotation_scale
@export var gap: float = 48 #64 Full step 32 Half Step
var moveDistance: float = 0
var trackResource: PackedScene = preload("res://Scenes/GPUParticleMode/GPUParticleTrack.tscn")
var tracks: Array[GPUParticles2D] = []
var current: int = 0

# From https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/index.html
var speed: float = 200  # move speed in pixels/sec
var rotation_speed: float = 2  # turning speed in radians/sec

func _ready() -> void:
	for i: int in range (200):
		var track: GPUParticles2D = trackResource.instantiate()
		add_child(track)
		tracks.append(track)

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
	tracks[current].emit_particle(get_global_transform(), Vector2.ZERO, Color.WHITE, Color.BLACK, FLAG) 
	current = (current + 1) % tracks.size()

func _exit_tree() -> void:
	# Free all the tracks which have the root parent
	for i: int in range(tracks.size()):
		tracks[i].queue_free()
