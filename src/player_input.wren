
class Player_input {
  static controls() {
    var done = false
    Game.dude.moving = false
    if (Input.is_key_held(Input.get_keycode("W")) && Game.dude.on_ground && !done) { //Jump
      Game.dude.moving = true
      Game.dude.vy = Game.dude.jump_force
      Game.dude.on_ground = false
      done = true
    }
     if (Input.is_key_held(Input.get_keycode("D")) && Input.is_key_held(Input.get_keycode("A")) && !done) { //Move Right
      Game.dude.moving = false
      done = true
    }
    if (Input.is_key_held(Input.get_keycode("A")) && !done) { //Move Right
      Game.dude.x = Game.dude.x - Game.dude.speed
      Game.dude.moving = true
      Game.dude.sprite_direction="Left"
      done = true
    }
    if (Input.is_key_held(Input.get_keycode("D")) && !done) { //Move left
      Game.dude.x = Game.dude.x + Game.dude.speed
      Game.dude.moving = true
      Game.dude.sprite_direction="Right"
      done = true
    }
    if (Input.is_key_pressed(1)) { //Safe Shutdown
      // LOGS.close()
      Engine.destroy()
    }
    
  }
}