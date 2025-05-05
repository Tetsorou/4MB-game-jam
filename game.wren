/*
  la linea 1 del documento es representada como 330 en los errores
*/
//
// Configuracion de la ventana  
var WIDTH = 640
var HEIGHT = 360
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
      DUDE = Guy.new(WIDTH / 2, HEIGHT / 2, 20, 20, "sprites/idleSmallerSoldier1.png")
    }
    return DUDE
  }
  
  static init(args) {
    Engine.init(WIDTH, HEIGHT, TITLE)
    // LOGS = FileIO.open("./logs.txt", "write")
  }

  static tick(dt) {
    //Hace que el juego corra a 60 fps constantes, excepto el proceso de dibujo
    TDT = TDT+dt
    if (TDT > 1/60 || FPS % 5 == 0) {
      
      Player_input.controls()
      dude.physics()
      COUNTER = COUNTER + TDT
      TDT = 0
      FPS = FPS + 1
      
    }
    if (COUNTER > 1) {
      LAST_FPS = FPS
      // LOGS.write("FPS: %(FPS)")
      COUNTER = 0
      FPS = 0
    }
    this.draw()
  }
    static draw() {
      Draw.clear(Color.BLACK) //Fondo
      Floor.draw()
      dude.draw() //Dibujando instancia de Guy
      Draw.text(0,0,"FPS:%(LAST_FPS)",255,255,255,255)
      
      
    }
}

class Guy {
  //getters
  sprite_path {_sprite_path}
  sprite {_sprite}
  width {_width}
  height {_height}
  x {_x}
  y {_y}
  speed {_speed}
  gravity {_gravity}
  on_ground {_on_ground}
  vy {_vy} // velocidad en y
  jump_force {_jump_force}
  //setters
  sprite_path=(value) {_path = value}
  sprite=(value) {_sprite = value}
  x=(value) {_x= value}
  y=(value){_y= value}
  on_ground=(value) {_on_ground = value}
  vy=(value) {_vy = value} 
  jump_force=(value) {_jump_force = value}


  construct new(x1,y1,width1,height1,path) {
    _sprite_path = path
    _x = x1
    _y = y1
    _width = width1
    _height = height1
    _sprite = Surface.new_from_png(sprite_path)
    _vy = 0
    _speed = 2
    _jump_force = -5
    _on_ground = false
    _gravity = 0.3
  }

   draw() {
    Surface.draw(sprite, x, y, 1)
  }
  physics() {
    // Aplicar gravedad
    vy = vy + gravity
    y = y + vy

    // Colisión con el piso
    if (y + height >= FLOOR_Y) {
      y = FLOOR_Y - height +1
      vy = 0.0
      on_ground = true
    } else {
      on_ground = false
    }
    // Límites de pantalla
    if (x < 0) {
      x = 0
    }
    if (x  > WIDTH - width ) {
      System.print("%(x  > WIDTH - width)")
      x = WIDTH - width 
    }
    if (y < 0) {
      y = 0 
      vy = 0.0
    }
  }

}

class Floor {
  static draw() {
    Draw.rectangle(0, FLOOR_Y,WIDTH, FLOOR_HEIGHT,0, 200, 0, 255, true)
  }
}

class Player_input {
  static controls() { 
    if (Input.is_key_held(Input.get_keycode("W")) && Game.dude.on_ground) { //Jump
      Game.dude.vy = Game.dude.jump_force
      Game.dude.on_ground = false
    }
    if (Input.is_key_held(Input.get_keycode("A"))) { //Move Right
      Game.dude.x = Game.dude.x - Game.dude.speed
      // LOGS.write("moving right: guy x: %(Game.dude.x), width: %(WIDTH)\n")
    }
    if (Input.is_key_held(Input.get_keycode("D"))) { //Move left
      Game.dude.x = Game.dude.x + Game.dude.speed
      // LOGS.write("moving left: guy x: %(Game.dude.x), width: %(WIDTH)\n")
    }
    if (Input.is_key_held(Input.get_keycode("L"))) { //Safe Shutdown
      // LOGS.close()
      Engine.destroy()
    }
  }
}
