// Configuracion de la ventana  
var WIDTH = 320 //640
var HEIGHT =180 //360
var TITLE = "4MB-game-jam"
 
// --- Piso ---
var FLOOR_HEIGHT = 50
var FLOOR_Y = HEIGHT - FLOOR_HEIGHT

var LOGS = null
var DUDE = null

var TDT = 0 //Total delta time
var COUNTER = 0
var FPS = 0
var LAST_FPS = 0


class Game {
  //instancia de Guy
  static dude {
    if (DUDE == null) {
      DUDE = Guy.new(WIDTH / 2, HEIGHT / 2, 20, 20, "Soldier/Soldier", {
        "Idle":6,
        "Walk":8
      })
    }
    return DUDE
  }
  
  static init(args) {
    Engine.init(WIDTH, HEIGHT, TITLE)
  }

  static tick(dt) {
    TDT = TDT+dt
    //Hace que el juego corra a 60 fps constantes, excepto el proceso de dibujo
    if (TDT > 1/60 || FPS % 10 == 0 ) {
      // methods to be updated at a somewhat constant speed
      Player_input.controls()
      dude.physics()
      dude.animation_type() //Dibujando instancia de Guy
      COUNTER = COUNTER + TDT
      TDT = 0
      FPS = FPS + 1
    }
    if (COUNTER > 1) {
      LAST_FPS = FPS
      COUNTER = 0
      FPS = 0
    }
    if (TDT > 1/120) {
        draw()
    }
  }
    static draw() {
      Draw.clear(Color.BLUE) //Fondo
      Floor.draw()
      dude.draw(dude.current_sprite)
      Draw.text(0,0,"FPS:%(LAST_FPS)",255,255,255,255)
    }
}


