// Configuracion de la ventana 
var WIDTH = 400
var HEIGHT = 240
var TITLE = "4MB-game-jam"
 
// Control de frames 
var TIME = 0.0
var DIFF = 0
var WAIT = 1/60

// Parámetros del jugador y recursos 
var GUY_SPRITE_PATH = "sprites/Soldier1.png"
var GUY_SPRITE = null
var GUY_WIDTH = 32
var GUY_HEIGHT = 32
var GUY_X = 100.0
var GUY_Y = 0.0

var GUY_MOVE_DISTANCE = 0.2
var GUY_DIAGONAL_MOVE_DISTANCE = Math.sin(Math.PI / 4) * GUY_MOVE_DISTANCE

// Fisica vertical
var GUY_VY = 0.0
var GRAVITY = 0.3
var JUMP_FORCE = -5.0
var ON_GROUND = false

var DONE = false

// --- Piso ---
var FLOOR_HEIGHT = 50
var FLOOR_Y = HEIGHT - FLOOR_HEIGHT

class Game {
  static init(args) {
    Engine.init(WIDTH, HEIGHT, TITLE)
    GUY_SPRITE = Surface.new_from_png(GUY_SPRITE_PATH)
  }

  static tick(dt) {
    DIFF = System.clock - TIME
    if (DIFF * 1000 > WAIT) {
      TIME = System.clock
      Draw.clear()
      Floor.draw()
      Guy.draw_guy()
    }
  }
}

class Guy {
  static draw_guy() {
    // Aplicar gravedad
    GUY_VY = GUY_VY + GRAVITY
    GUY_Y = GUY_Y + GUY_VY

    // Colisión con el piso
    if (GUY_Y + GUY_HEIGHT >= FLOOR_Y) {
      GUY_Y = FLOOR_Y - GUY_HEIGHT
      GUY_VY = 0.0
      ON_GROUND = true
    } else {
      ON_GROUND = false
    }

    // Dibujar sprite
    Surface.draw(GUY_SPRITE, GUY_X, GUY_Y, 1)

    // Salto con W
    if (Input.is_key_pressed(Input.get_keycode("W")) && ON_GROUND && !DONE) {
      GUY_VY = JUMP_FORCE
      ON_GROUND = false
      DONE = true
    }

    // Movimientos WASD y diagonales
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
    if (Input.is_key_held(Input.get_keycode("D")) && !DONE) {
      GUY_X = GUY_X + GUY_MOVE_DISTANCE
      DONE = true
    }
    if (Input.is_key_held(Input.get_keycode("W")) && !DONE) {
      GUY_Y = GUY_Y - GUY_MOVE_DISTANCE
      DONE = true
    }
    if (Input.is_key_held(Input.get_keycode("S")) && !DONE) {
      GUY_Y = GUY_Y + GUY_MOVE_DISTANCE
      DONE = true
    }

    DONE = false

    // Límites de pantalla
    if (GUY_X < 0) {
      GUY_X = 0
    }
    if (GUY_X + GUY_WIDTH > WIDTH) {
      GUY_X = WIDTH - GUY_WIDTH
    }
    if (GUY_Y < 0) {
      GUY_Y = 0
      GUY_VY = 0.0
    }
  }
}

class Floor {
  static draw() {
    Draw.rectangle(0, FLOOR_Y,WIDTH, FLOOR_HEIGHT,0, 200, 0, 255, true)
  }
}
