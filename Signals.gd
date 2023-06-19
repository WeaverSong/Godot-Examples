class_name Player extends Node2D

var hp = 10

signal died() # define signal
signal hurt(hp_old, hp_new) # signals can take arguments

func apply_damage(dmg):
	var hp_old = hp
	hp -= dmg
	hurt.emit(hp_old, hp) # emit signal and pass arguments
	if hp <= 0:
		emit_signal("died") # You can still do it by string name, but why would you?

func _ready():
	# connect signal "died" to function "_on_death". Any parameters in the signal must be matched by parameters in the function.
	died.connect(_on_death)

func _on_death():
	queue_free() # Queue this node to be freed from memory at the end of the frame.