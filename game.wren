var WIDTH = 400 //This line is #330
var HEIGHT = 240
var TITLE= "4MB-game-jam"

var TIME = 0.0
var DIFF = 0
var WAIT = 1/60

var GUY_X = 0.0
var GUY_Y = 0.0
var GUY_MOVE_DISTANCE = 0.2
var GUY_DIAGONAL_MOVE_DISTANCE = Math.sin(45) * 0.2
var DONE = false

class Game {
    static init(args) {
        Engine.init(WIDTH/2,HEIGHT/2,TITLE)
        Draw.clear()
       
    }
    static tick(dt) {
        
        DIFF = System.clock - TIME
        if (DIFF * 1000 > WAIT) {
            Guy.draw_guy()
        }

        TIME = System.clock
    }   
}
class Guy {
    static draw_guy() {
        Draw.clear()

        Surface.draw(Surface.new_from_png("sprites/Soldier1.png"), GUY_X, GUY_Y,1)
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