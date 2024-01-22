extends Node

signal start_game
signal hide_player

# Method to update the score
func update_score(new_score):
	$MarginContainer/Score.text = str(new_score)

# Changes the text of the message and starts the timer
func show_message(text):
	$Message.text = text
	$Message.show()
	$Timer.start()


# Method to update the timer
func update_timer(new_time):
	$MarginContainer/Time.text = str(new_time)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_game_over():
	show_message("Game Over")
	await $Timer.timeout
	hide_player.emit()
	$StartButton.show()
	$Message.text = "Coin Dash!"
	$Message.show()

func _on_timer_timeout():
	$Message.hide()
	
# Event that hides the start button and starts the game 
# When the button is pressed
func _on_start_button_pressed():
	$StartButton.hide()
	$Message.hide()
	start_game.emit()
