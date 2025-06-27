extends Node2D

var bottom: Layer
var face: Layer
var footwear: Layer
var hair_back: Layer
var hair_front: Layer
var hair_top: Layer
var hat: Layer
var left_ear: Layer
var pose: PoseLayer
var right_ear: Layer
var top: Layer
var background: Layer

func _ready() -> void:
	# load resources
	bottom = get_node(^"Bottom")
	face = get_node(^"Face")
	footwear = get_node(^"Footwear")
	hair_back = get_node(^"HairBack")
	hair_front = get_node(^"HairFront")
	hair_top = get_node(^"HairTop")
	hat = get_node(^"Hat")
	left_ear = get_node(^"LeftEar")
	pose = get_node(^"Pose")
	right_ear = get_node(^"RightEar")
	top = get_node(^"Top")
	background = get_node(^"Background")
	background.z_index = -1
	pass
