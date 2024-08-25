class_name SpriteTank
extends CharacterBody2D

# From https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/index.html
var speed: float = 200  # move speed in pixels/sec
var rotation_speed: float = 2  # turning speed in radians/sec
@onready var tracks: SpriteTracks = $SpriteTracks

func _physics_process(delta: float) -> void:
	var move_input: float = Input.get_axis("ui_down", "ui_up")
	var rotation_direction: float = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	var _collide: bool = move_and_slide()
	tracks.moved(velocity.length() * delta)
