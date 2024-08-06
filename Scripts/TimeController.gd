extends Node

var lastSaveTime
var elapsedTime
var currentTime

func calculate_elapsed_time(previoustime):
	lastSaveTime = previoustime
	currentTime = Time.get_unix_time_from_system()
	elapsedTime = currentTime - lastSaveTime
	return elapsedTime
