var WIDTH = 320
var HEIGHT = 120
var TITLE= "4MB-game-jam"
class Game {
    static init(args) {
        Engine.init(WIDTH,HEIGHT,TITLE)
        Draw.clear()
        var surface = Surface.new_from_png("Soldier1.png")
        Surface.draw(surface, 0, 0)
    }
    static tick(dt) {
        
    }
}