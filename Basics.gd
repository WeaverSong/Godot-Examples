# Single-line comments are written using hash symbol.
"""
  Multi-line
  comments
  are
  written
  using
  multi-line strings.
"""

# Script file is a class in itself and you can optionally define a name for it.
class_name MyClass

# Inheritance
extends Node2D

# Member variables
var x = 8 # int
var y = 1.2 # float
var b = true # bool
var s = "Hello World!" # String
var a = [1, false, "brown fox"] # Array - similar to list in Python,
								# it can hold different types
								# of variables at once.
var d = {
	"key" : "value",
	42 : true
} # Dictionary holds key-value pairs.

var p_arr = PackedStringArray(["Hi", "there", "!"]) # Packed arrays can only hold a single/certain type, but are more memory-efficient for doing so.

# Built-in vector types:
var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

# Constants
const ANSWER_TO_EVERYTHING = 42
const BREAKFAST = "Spam and eggs!"

# Enums
enum { ZERO, ONE , TWO, THREE }
enum NamedEnum { ONE = 1, TWO, THREE }

# Exported variables are visible in the inspector.
@export var age: int
@export var height: float
@export var person_name = "Bob" # Export type hints are unnecessary
								# if you set a default value.

# Functions
func foo():
	pass # pass keyword is a placeholder for future code

func add(first, second):
	return first + second

# Printing values
func printing():
	print("GDScript ", "is ", " awesome.")
	prints("These", "words", "are", "divided", "by", "spaces.")
	printt("These", "words", "are", "divided", "by", "tabs.")
	printraw("This gets printed to system console. Does not auto-add a newline at the end.")

# Math
func doing_math():
	var first = 8
	var second = 4
	print(first + second) # 12
	print(first - second) # 4
	print(first * second) # 32
	print(first / second) # 2 #Integer division, decimal part will be discarded. You have to cast an input to a float to get float division.
	print(first % second) # 0
	# There are also +=, -=, *=, /=, %= etc.,
	# however no ++ or -- operators.
	print(pow(first, 2)) # 64
	print(sqrt(second)) # 2
	printt(PI, TAU, INF, NAN) # built-in constants

# Control flow
func control_flow():
	x = 8
	y = 2 # y was originally a float,
		# but we can change its type to int
		# using the power of dynamic typing!

	if x < y:
		print("x is smaller than y")
	elif x > y:
		print("x is bigger than y")
	else:
		print("x and y are equal")

	var a = true
	var b = false
	var c = false
	if a and b or not c: # alternatively you can use &&, || and !
		print("This is true!")

	for i in range(20): # GDScript's range is similar to Python's
		print(i) # so this will print numbers from 0 to 19

	for i in 20: # unlike Python, you can loop over an int directly
		print(i) # so this will also print numbers from 0 to 19

	for i in ["two", 3, 1.0]: # iterating over an array
		print(i)

	while x > y:
		printt(x, y)
		y += 1

	x = 2
	y = 10
	while x < y:
		x += 1
		if x == 6:
			continue # 6 won't get printed because of continue statement
		prints("x is equal to:", x)
		if x == 7:
			break # loop will break on 7, so 8, 9 and 10 won't get printed

	#Match is more type strict than ==. 1 will not match 1.0, for example. However, String and StringName are still considered to be equal.
	match x:
		1:
			print("Match is similar to switch.")
		2:
			print("However you don't need to put cases before each value.")
		3:
			print("Furthermore each case breaks on default.")
			#break # ERROR! Break statement is unnecessary!
		y:
			print("You can also use variables")
		_:
			print("Underscore is a default case.")
		var hi:
			print("Also a default case, but this one also grabs the value (", hi, ") into a new variable.")

	# ternary operator (one line if-else statement)
	prints("x is", "positive" if x >= 0 else "negative")

# Casting
func casting_examples():
	var i = 42 #Implicit int; will be treated as an int (integer division, for example) but its type can be changed.
	var f = float(42) # cast using variables constructor
	var b = i as bool # or using "as" keyword

# Override functions
# By a convention built-in overridable functions start with an underscore,
# but in practice you can override virtually any function.

# _init is called when object gets initialized
# This is the object's constructor.
func _init():
	# Initialize object's internal stuff here.
	pass

# _ready gets called when script's node and its children have entered the scene tree.
# Note that for nodes created by script, this will not happen until they are added as a child of a node within the scene tree, so you can change
# variables on them before this is called.
func _ready():
	pass

# _process gets called on every frame.
func _process(delta):
	# The delta argument passed to this function is the number of seconds which passed between the last frame and the current one.
	print("Delta time equals: ", delta)

# _physics_process gets called on every physics frame, which means delta should be constant. Important when dealing with physics bodies, especially RigidBodies
func _physics_process(delta):
	# Simple movement using vector addition and multiplication.
	var direction = Vector2(1, 0) # or Vector2.RIGHT
	var speed = 100.0
	self.global_position += direction * speed * delta
	# self refers to current class instance. Not actually needed for this line.

# When overriding you can call parent's function using the super keyword
func get_thing():
	# Do some additional things here.
	#var r = super() # call parent's implementation of the current function
	#var x = super.get_thing() # You can also specify an arbitrary parent function by name.
	#return r
	pass
	# The above lines throw errors because the parent class (Node2D) doesn't have that function, so super would fail.
	# You cannot (safely) override engine-supplied functions, except those prefixed with _, as the engine won't call your override.
	# Attempting to do so will result in an error unless that is disabled in the settings.

# Inner class
class InnerClass:
	extends Object

	func hello():
		print("Hello from inner class!")

func use_inner_class():
	var ic = InnerClass.new()
	ic.hello()
	ic.free() # use free for memory cleanup