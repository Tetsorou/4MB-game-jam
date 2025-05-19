// Configuracion de la ventana  

var TOOL_WIDTH = 80
var WIDTH = 320//640
var HEIGHT =180 //360
var TITLE = "4MB-game-jam"
 
// --- Piso ---
// var FLOOR_HEIGHT = 50
// var FLOOR_Y = HEIGHT - FLOOR_HEIGHT

var TDT = 0 //Total delta time
var COUNTER = 0
var FPS = 0
var LAST_FPS = 0

var STOP = false

class Game {
      //instancia de Guy
  static dude {
    if (__dude == null) {
      __dude = Guy.new(WIDTH / 2, HEIGHT / 2, 20, 20, "Soldier/Soldier", {
        "Idle":6,
        "Walk":8
      })
    }
    return __dude
  }
    static enemy {
    if (__enemy == null) {
      __enemy = Enemy.new(100, 100, 20, 20, "Soldier/Soldier", {
        "Idle": 6,
        "Walk": 8
      })
    }
    return __enemy
  }
  
  static init(args) {
    Engine.init(WIDTH, HEIGHT, TITLE)
     Draw.clear(Color.new(33,38,63))
     Tiles.init()
    Level_test.init()
  }

  static tick(dt) {
    TDT = TDT+dt
    //Hace que el juego corra a 60 fps constantes, excepto el proceso de dibujo
    if ((TDT > 1/60 || FPS % 10 == 0) && !STOP)  {
      // methods to be updated at a somewhat constant speed
        dude.physics()
        dude.animation() //Dibujando instancia de Guy
        enemy.animation()
        //enemy.tick()

         fps_show()
        COUNTER = COUNTER + TDT
        TDT = 0
        FPS = FPS + 1
        Player_input.controls()
        draw()

    }
   
    if (TDT > 1/120) {
      __enemy.auto_move()
    }

  }
  static fps_show() {
    if (COUNTER > 1) {
      LAST_FPS = FPS
      COUNTER = 0
      FPS = 0
    }
  }
    static draw() {
      Draw.clear(Color.new(33,38,63)) //Fondo
    //   floor.draw()
      // Level_maker.draw_from_map()
      
      Level_test.draw_from_map()
       Draw.text(0,0,"FPS:%(LAST_FPS)",255,255,255,255)
       dude.draw(dude.current_sprite)
       enemy.draw(enemy.current_sprite) // Dibujar al enemigo
      // Draw.line(WIDTH , 0, WIDTH, HEIGHT, 0,0,0,255)
    }
}