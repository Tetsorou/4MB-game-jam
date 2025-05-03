var WIDTH = 400
var HEIGHT = 200
var TITLE= "4MB-game-jam"
var GUY_X = 0.0
var GUY_Y = 0.0

var TIME = 0.0
var DIFF = 0
var WAIT = 0


class Game {
    static init(args) {
        Engine.init(WIDTH,HEIGHT,TITLE)
        Draw.clear()
        
    }
    static tick(dt) {
        WAIT = 1/60
        DIFF = System.clock - TIME
        while (DIFF < WAIT) {
            System.print(dt)
        }
        System.print("Hi")
        this.draw_guy()
        TIME = System.clock
    }
    
    static draw_guy() {
         Draw.clear()
            Surface.draw(Surface.new_from_png("Soldier1.png"), GUY_X, GUY_Y,1)

            if (Input.is_key_held(Input.get_keycode("A"))) {
                GUY_X = GUY_X - 0.2
            //    System.print(GUY_X)
            }
            if (Input.is_key_held(Input.get_keycode("D"))) {
                GUY_X = GUY_X + 0.2
          //      System.print(GUY_X)
            }
            if (Input.is_key_held(Input.get_keycode("W"))) {
                GUY_Y = GUY_Y - 0.2
            //    System.print(GUY_Y)
            }
            if (Input.is_key_held(Input.get_keycode("S"))) {
                GUY_Y = GUY_Y + 0.2
              //  System.print(GUY_Y)
            }
           
    }
    
}
