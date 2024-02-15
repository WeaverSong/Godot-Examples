extends Node

var x: int # define typed variable
var y: float = 4.2
var z := 1.0 # infer type based on default value using := operator
var my_array: Array[float] = [1.0, 2.5] # Array that can only hold a single type. Does not support any more complex typings (combinations, etc.)

@onready var node_ref_typed := $Child as Node

@export var speed := 50.0

const CONSTANT := "Typed constant."

# function returns nothing
func _ready() -> void:
	#x = "string" # ERROR! Type can't be changed!
	return

# function takes two Strings and returns a String
func join(arg1: String, arg2: String) -> String:
	return arg1 + arg2

# function takes an int and returns a Node
func get_child_at(index: int) -> Node:
	return get_children()[index]

signal example(arg: int) # While you can type a signal's argument, this type is not actually enforced. (It seems to be forgotten instantly)
