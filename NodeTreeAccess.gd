extends Node2D

var sprite # This variable will hold the reference.

# You can get references to child nodes in _ready.
# _init is called from parent to child, _ready is called from child to parent; so when _init is called your children do not exist, but when _ready is
# called they do.

# _ready also is only called when you enter the scene tree for the FIRST TIME, so when instantiating a node/PackedScene from code, you can set variables
# on it before _ready by setting them before using add_child or similar and thus adding it to the scene tree.

func _ready() -> void:
	# NodePath is useful for accessing nodes.
	# Create NodePath by passing String to its constructor:
	var _path1 = NodePath("path/to/something")
	# Or by using NodePath literal:
	var _path2 = ^"path/to/something"
	# NodePath examples:
	var path3 = ^"Sprite" # relative path, immediate child of the current node
	var _path4 = ^"Timers/Firerate" # relative path, child of the child
	var _path5 = ^".." # current node's parent
	var _path6 = ^"../Enemy" # current node's sibling
	var _path7 = ^"/root" # absolute path, equivalent to get_tree().get_root()
	var _path8 = ^"/root/Main/Player/Sprite" # absolute path to Player's Sprite
	var _path9 = ^"Timers/Firerate:wait_time" # accessing properties
	var _path10 = ^"Player:position:x" # accessing subproperties

	# Finally, to get a reference use one of these:
	sprite = get_node(^"Sprite") as Sprite2D # always cast to the type you expect (if you want any intellisense)
	sprite = get_node("Sprite") as Sprite2D # here String gets implicitly cast to NodePath.
	# The only advantage to using NodePath instead of string is that NodePath's can be stored in a variable, and will be parsed then, rather than waiting
	# until you call get_node with it, or for exporting.
	sprite = get_node(path3) as Sprite2D
	sprite = get_node_or_null("Sprite") as Sprite2D # Same as get_node, but doesn't log an error if it returns null
	sprite = $Sprite as Sprite2D
	sprite = get_node("%Sprite") as Sprite2D #Access the node in the current scene with the UniqueName of Sprite.
	sprite = %Sprite as Sprite2D # Same as above
	sprite = get_node("/root/Main/%Player/%Sprite") as Sprite2D # UniqueName access depends not on the scene your node is in, but the scene your path is in.

#Prefix a variable name with _ to indicate that it is not expected to be used, hiding the warning.
func _process(_delta):
	# Now we can reuse the reference in other places.
	prints("Sprite has global_position of", sprite.global_position)

# Use @onready annotation to assign a value to a variable just before _ready executes. Useful for storing references to child nodes who would not otherwise exist when the variable is assigned.
@onready var timer: Timer = $Timer

# You can export NodePath, so you can assign it within the inspector.
@export var nodepath: NodePath = ^""
@onready var reference = get_node(nodepath) as Node
# You can also export any Node directly, so you don't have to manually call get_node.
@export var node: Node