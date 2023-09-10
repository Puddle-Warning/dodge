extends CanvasLayer

# Notifies Main node that the button as been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_menu(text):
	$ScoreLabel.hide()
	$Message.text = text
	$Message.show()
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("You suck!")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.5).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_message_timer_timeout():
	$Message.hide()


func _on_startbutton_pressed():
	$StartButton.hide()
	$ScoreLabel.show()
	start_game.emit()
	get_tree().change_scene_to_file("res://phase_1.tscn")
