class_name GPUParticleTracks
extends Node2D

@export var gap: float = 48 #64 Full step 32 Half Step
var moveDistance: float = 0
var trackResource: PackedScene = preload("res://Scenes/GPUParticleMode/GPUParticleTrack.tscn")
var tracks: Array[GPUParticleTrack] = []
var current: int = 0

func _ready() -> void:
	for i: int in range(1):
		var track: GPUParticleTrack = trackResource.instantiate()
		tracks.append(track)
		track.emitting = true

func moved(distance: float) -> void:
	moveDistance += distance
	if moveDistance > gap:
		moveDistance -= gap
		place()

func place() -> void:
	tracks[current].emit_particle(get_global_transform(), Vector2.ZERO, Color.BLACK, Color.BLACK, GPUParticles2D.EMIT_FLAG_POSITION)
	current = (current + 1) % tracks.size()
