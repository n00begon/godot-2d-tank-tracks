extends Node2D

var spriteTankResource: PackedScene = preload("res://Scenes/SpriteMode/SpriteTank.tscn")
var lineTankResource: PackedScene = preload("res://Scenes/LineMode/LineTank.tscn")
var cpuParticleTankResource: PackedScene = preload("res://Scenes/CPUParticleMode/CPUParticleTank.tscn")
var gpuParticleTankResource: PackedScene = preload("res://Scenes/GPUParticleMode/GPUParticleTank.tscn")

var current: CharacterBody2D

func _on_sprite_button_pressed() -> void:
	_clear()
	current = spriteTankResource.instantiate()
	add_child(current)

func _on_line_button_pressed() -> void:
	_clear()
	current = lineTankResource.instantiate()
	add_child(current)

func _on_cpu_particle_button_pressed() -> void:
	_clear()
	current = cpuParticleTankResource.instantiate()
	add_child(current)

func _on_gpu_particle_button_pressed() -> void:
	_clear()
	current = gpuParticleTankResource.instantiate()
	add_child(current)

func _clear() -> void:
	if current != null:
		current.queue_free()
