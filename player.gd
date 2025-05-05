extends CharacterBody2D

const speed = 50


@onready var anim_sprite = get_node("AnimatedSprite2D")

var anim_direction = "down"
var anim_state = "idle_down"

	
	
func _physics_process(delta):
	get_input()
	
	#animation
	if (velocity.x > 0):
		anim_direction = "side"
		anim_sprite.flip_h = false
	if (velocity.x < 0):
		anim_direction = "side"
		anim_sprite.flip_h = true

	if (velocity.y > 0):
		anim_direction = "down"
	if (velocity.y < 0):
		anim_direction = "up"
	
	if (velocity == Vector2(0, 0)):
		anim_state = "idle_"+anim_direction
	else:
		anim_state = "walk_"+anim_direction
		
		
	anim_sprite.play(anim_state)
	
	move_and_slide()
	
	
	
	
	
	
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	print(velocity)
