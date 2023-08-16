extends CanvasLayer

# Notifies Main node that the button as been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("You suck!")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the\nmonsters!"
	$Message.show()
	
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.5).timeout
	$Startbutton.show()

func update_score(score):
	$ScoreLabel.text = str(score)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_message_timer_timeout():
	$Message.hide()


func _on_startbutton_pressed():
	$Startbutton.hide()
	start_game.emit()
