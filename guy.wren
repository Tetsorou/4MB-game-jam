var GUY_X = 0.0
var GUY_Y = 0.0
var GUY_MOVE_DISTANCE = 0.2
var GUY_DIAGONAL_MOVE_DISTANCE = Math.sin(45) * 0.2

class Guy {
    static draw_guy() {
        Draw.clear()

        Surface.draw(Surface.new_from_png("Soldier1.png"), GUY_X, GUY_Y,1)
        if (Input.is_key_held(Input.get_keycode("S")) && Input.is_key_held(Input.get_keycode("D")) && !DONE) {
            GUY_Y = GUY_Y + GUY_DIAGONAL_MOVE_DISTANCE
            GUY_X = GUY_X + GUY_DIAGONAL_MOVE_DISTANCE
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("S")) && Input.is_key_held(Input.get_keycode("A")) && !DONE) {
            GUY_Y = GUY_Y + GUY_DIAGONAL_MOVE_DISTANCE
            GUY_X = GUY_X - GUY_DIAGONAL_MOVE_DISTANCE
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("W")) && Input.is_key_held(Input.get_keycode("D")) && !DONE) {
            GUY_Y = GUY_Y - GUY_DIAGONAL_MOVE_DISTANCE
            GUY_X = GUY_X + GUY_DIAGONAL_MOVE_DISTANCE
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("W")) && Input.is_key_held(Input.get_keycode("A")) && !DONE) {
            GUY_Y = GUY_Y - GUY_DIAGONAL_MOVE_DISTANCE
            GUY_X = GUY_X - GUY_DIAGONAL_MOVE_DISTANCE
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("A")) && !DONE) {
            GUY_X = GUY_X - GUY_MOVE_DISTANCE
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("D"))&& !DONE) {
            GUY_X = GUY_X + GUY_MOVE_DISTANCE  
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("W"))&& !DONE) {
            GUY_Y = GUY_Y - GUY_MOVE_DISTANCE
            DONE = true
        }
        if (Input.is_key_held(Input.get_keycode("S"))&& !DONE) {
            GUY_Y = GUY_Y + GUY_MOVE_DISTANCE
            DONE = true
        }
        
        DONE = false
    }
}