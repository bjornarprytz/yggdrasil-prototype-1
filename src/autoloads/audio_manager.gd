extends Node2D

var active_players: Array[AudioStreamPlayer] = []

var dormant_players: Array[AudioStreamPlayer] = []


func play(sound: AudioStream):
	var p = _get_player()
	p.stream = sound
	p.play()
	p.finished.connect(_release_player.bind(p), CONNECT_ONE_SHOT)

func _get_player() -> AudioStreamPlayer:
	if (dormant_players.is_empty()):
		var p = AudioStreamPlayer.new()
		add_child(p)
		p.volume_db = -15
		return p
	else:
		return dormant_players.pop_back()

func _release_player(p: AudioStreamPlayer):
	p.stop()
	p.stream = null
	active_players.erase(p)
	dormant_players.push_front(p)
