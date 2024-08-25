class_name SpriteTracks
extends Node2D

@export var gap: float = 48 #64 Full step 32 Half Step
var moveDistance: float = 0
var trackResource: PackedScene = preload("res://Scenes/SpriteMode/SpriteTrack.tscn")
var tracks: Array[SpriteTrack] = []
var current: int = 0

func _ready() -> void:
	for i: int in range(100):
		var track: SpriteTrack = trackResource.instantiate()
		tracks.append(track)
		# Add the tracks to the root so they don't move with the tank
		get_tree().root.add_child.call_deferred(track)

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
