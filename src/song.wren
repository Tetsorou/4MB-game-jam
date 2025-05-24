class Song {
  construct new(path) {
    _sound = Sound.load_ogg(path)
    _isPlaying = false
  }

  play() {
    if (!_isPlaying) {
      _sound.play()
      _isPlaying = true
    }
  }

  stop() {
    _isPlaying = false
  }

  isPlaying { _isPlaying }
}