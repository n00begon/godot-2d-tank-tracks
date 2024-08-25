extends Node2D

var spriteTankResource: PackedScene = preload("res://Scenes/SpriteMode/SpriteTank.tscn")
var lineTankResource: PackedScene = preload("res://Scenes/LineMode/LineTank.tscn")

var current: CharacterBody2D

func _on_sprite_button_pressed() -> void:
	clear()
	current = spriteTankResource.instantiate()
	add_child(current)

func _on_line_button_pressed() -> void:
	clear()
	current = lineTankResource.instantiate()
	add_child(current)

func clear() -> void:
	if current != null:
		current.queue_free()
