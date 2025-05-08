

var IS_ANCHOR_SET = false
class Player_input {
  static controls() {
    var done = false
    if (Input.is_key_pressed(Input.button_mouse_left)) {
        if (!IS_ANCHOR_SET) {
            
        }
    }
    if (Input.is_key_held(Input.get_keycode("W")) && Game.dude.on_ground && !done) { //Jump
      done = true

    }
     if (Input.is_key_held(Input.get_keycode("D")) && Input.is_key_held(Input.get_keycode("A")) && !done) { //Move Right

      done = true
    }
    if (Input.is_key_held(Input.get_keycode("A")) && !done) { //Move Right
      done = true
    }
    if (Input.is_key_held(Input.get_keycode("D")) && !done) { //Move left

      done = true
    }
    if (Input.is_key_held(Input.get_keycode("L"))) { //Safe Shutdown
      // LOGS.close()
      Engine.destroy()
    }
    
  }
}