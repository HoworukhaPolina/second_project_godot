extends Area2D

@export var speed = 70
var screen_size


func _ready():
 screen_size = get_viewport_rect().size
func start(pos_sprite):
 position = pos_sprite
 show() 
 $CollisionPolygon2D.disabled = false


func _process(delta):
 var velocity = Vector2.ZERO
 if Input.is_action_pressed("move_right"):
  velocity.x += 1
 if Input.is_action_pressed("move_left"):
  velocity.x -= 1
 
 if velocity.length() > 0:
  velocity = velocity.normalized() * speed
  $AnimatedSprite2D.play()
 else:
  $AnimatedSprite2D.stop()
 
 position += velocity * delta 
#position = position.clamp(Vector2.ZERO, screen_size)
