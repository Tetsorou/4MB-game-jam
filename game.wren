var WIDTH = 400
var HEIGHT = 200
var TITLE= "4MB-game-jam"

var TIME = 0.0
var DIFF = 0
var WAIT = 1/60

var DONE = false

import "guy"

class Game {
    static init(args) {
        Engine.init(WIDTH/2,HEIGHT/2,TITLE)
        Draw.clear()
    }
    static tick(dt) {
        DIFF = System.clock - TIME
        if (DIFF * 1000 > WAIT) {
            guy.draw_guy()
        }

        TIME = System.clock
    }   
}
