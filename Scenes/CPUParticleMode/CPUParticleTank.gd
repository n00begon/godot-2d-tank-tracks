class_name CPUParticleTank
extends CharacterBody2D

# From https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/index.html
var speed: float = 200  # move speed in pixels/sec
var rotation_speed: float = 2  # turning speed in radians/sec
@onready var track: CPUParticles2D = $CPUParticleTrack

func _physics_process(delta: float) -> void:
	var move_input: float = Input.get_axis("move_back", "move_forward")
	var rotation_direction: float = Input.get_axis("turn_left", "turn_right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	var _collide: bool = move_and_slide()
	track.emitting = velocity != Vector2.ZERO
