var WIDTH = 320
var HEIGHT = 120
var TITLE= "4MB-game-jam"
var guy = Surface.new_from_png("Soldier1.png")

class Game {
    static init(args) {
        Engine.init(WIDTH,HEIGHT,TITLE)
        Draw.clear()
        
    }
    static tick(dt) {
        Draw.clear()
        Surface.draw(guy, 0, 0)
    }
}