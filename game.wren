var WIDTH = 400
var HEIGHT = 200
var TITLE= "4MB-game-jam"
var GUY_X = 0.0
var GUY_Y = 0.0
var GUY_MOVE_DISTANCE = 0.2
var GUY_DIAGONAL_MOVE_DISTANCE = Math.sqrt( (GUY_MOVE_DISTANCE * GUY_MOVE_DISTANCE) + (GUY_MOVE_DISTANCE * GUY_MOVE_DISTANCE))

var TIME = 0.0
var DIFF = 0
var WAIT = 1/60


class Game {
    static init(args) {
        Engine.init(WIDTH,HEIGHT,TITLE)
        Draw.clear()
        
    }
    static tick(dt) {
        DIFF = System.clock - TIME
        if (DIFF * 1000 > WAIT) {
            this.draw_guy()
        }

        TIME = System.clock
    }
    
    static draw_guy() {
         Draw.clear()
         
            Surface.draw(Surface.new_from_png("Soldier1.png"), GUY_X, GUY_Y,1)

            if (Input.is_key_held(Input.get_keycode("A"))) {
                GUY_X = GUY_X - GUY_MOVE_DISTANCE
            }
            if (Input.is_key_held(Input.get_keycode("D"))) {
                GUY_X = GUY_X + GUY_MOVE_DISTANCE  
            }
            if (Input.is_key_held(Input.get_keycode("W"))) {
                GUY_Y = GUY_Y - GUY_MOVE_DISTANCE
            }
            if (Input.is_key_held(Input.get_keycode("S"))) {
                GUY_Y = GUY_Y + GUY_MOVE_DISTANCE
            }
            if (Input.is_key_held(Input.get_keycode("S")) && Input.is_key_held(Input.get_keycode("D"))) {
                GUY_Y = GUY_Y + GUY_DIAGONAL_MOVE_DISTANCE
                GUY_X = GUY_X + GUY_DIAGONAL_MOVE_DISTANCE
            }
            if (Input.is_key_held(Input.get_keycode("S")) && Input.is_key_held(Input.get_keycode("A"))) {
                GUY_Y = GUY_Y + GUY_DIAGONAL_MOVE_DISTANCE
                GUY_X = GUY_X - GUY_DIAGONAL_MOVE_DISTANCE
            }
            if (Input.is_key_held(Input.get_keycode("W")) && Input.is_key_held(Input.get_keycode("D"))) {
                GUY_Y = GUY_Y - GUY_DIAGONAL_MOVE_DISTANCE
                GUY_X = GUY_X + GUY_DIAGONAL_MOVE_DISTANCE
            }
            if (Input.is_key_held(Input.get_keycode("W")) && Input.is_key_held(Input.get_keycode("A"))) {
                GUY_Y = GUY_Y - GUY_DIAGONAL_MOVE_DISTANCE
                GUY_X = GUY_X - GUY_DIAGONAL_MOVE_DISTANCE
            }
           
    }
    
}
