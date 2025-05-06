class Guy {
moving {_moving}
sprite_path {_sprite_path} //animation variables
sprites {_sprites} //animation variables
sprite_key {_sprite_key} //animation variables
sprite_last {_sprite_last} //animation variables
sprite_index {_sprite_index} //animation variables
sprite_direction {_sprite_direction} //animation variables
width {_width}
height {_height}
x {_x}
y {_y}
speed {_speed}
gravity {_gravity}
on_ground {_on_ground}
vy {_vy} // velocidad en y
jump_force {_jump_force}
current_sprite {_current_sprite}
sprite_path=(value) {_path = value}  //animation variables
sprites=(value) {_sprites = value}  //animation variables
sprite_index=(value) {_sprite_index=value} //animation variables
sprite_direction=(value) {_sprite_direction=value} //animation variables
sprite_key=(value) {_sprite_key=value} //animation variables
sprite_last=(value) {_sprite_last=value} //animation variables
x=(value) {_x= value}
y=(value){_y= value}
on_ground=(value) {_on_ground = value}
vy=(value) {_vy = value}
jump_force=(value) {_jump_force = value}
current_sprite=(value) {_current_sprite = value}
moving=(value) {_moving = value}
construct new(x1,y1,width1,height1,path,smap) {
_sprite_path = path
_x = x1
_y = y1
_width = width1
_height = height1
_vy = 0
_speed = 1
_jump_force = -5
_on_ground = false
_gravity = 0.3
_sprites = smap
_sprite_index = 1
_sprite_direction="Right"
_sprite_last = ""
}
draw(current_sprite_param) {
Surface.draw_angle(current_sprite_param, x, y, 0)
}
animation () {
if (moving) {
sprite_key="Walk"
} else {
sprite_key="Idle"
}
var main = Fiber.current
var fiber = Fiber.new{ |value|
if ((FPS) % 10  == 0) {
sprite_index= sprite_index + 1
}
if (sprite_index > sprites[sprite_key]) {
sprite_index= 1
}
main.transfer(Surface.new_from_png("%(sprite_path)%(sprite_key)%(sprite_index)%(sprite_direction).png"))
}
var proceed = sprite_last == sprite_key
if (sprite_last != sprite_key) {
sprite_last = sprite_key
sprite_direction = sprite_direction
sprite_index = 1
}
current_sprite = fiber.transfer(proceed)
}
physics() {
vy = vy + gravity
y = y + vy
if (y + height/2 >= FLOOR_Y ) {
y = FLOOR_Y - height/2 +1
vy = 0.0
on_ground = true
} else {
on_ground = false
}
if (x < 0 + width/3) {
x = 0 + width/3
}
if (x  > WIDTH - width/3 ) {
x = WIDTH - width/3
}
if (y < 0) {
y = 0
vy = 0.0
}
}
}
/*
la linea 1 del documento es representada como 330 en los errores
*/
var WIDTH = 320 //640
var HEIGHT =180 //360
var TITLE = "4MB-game-jam"
var FLOOR_HEIGHT = 50
var FLOOR_Y = HEIGHT - FLOOR_HEIGHT
var LOGS = null
var DUDE = null
var TDT = 0 //Total delta time
var COUNTER = 0
var FPS = 0
var LAST_FPS = 0
var NUMBER_OF_TRUES = 0
class Game {
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
if (TDT > 1/60) {
NUMBER_OF_TRUES = NUMBER_OF_TRUES + 1
}
if (FPS % 10 == 0) {
NUMBER_OF_TRUES = NUMBER_OF_TRUES + 1
}
if (NUMBER_OF_TRUES == 1) {
NUMBER_OF_TRUES = 0
Player_input.controls()
dude.physics()
dude.animation() //Dibujando instancia de Guy
COUNTER = COUNTER + TDT
TDT = 0
FPS = FPS + 1
}
if (COUNTER > 1) {
LAST_FPS = FPS
COUNTER = 0
FPS = 0
}
draw()
}
static draw() {
Draw.clear(Color.BLUE) //Fondo
Floor.draw()
dude.draw(dude.current_sprite)
Draw.text(0,0,"FPS:%(LAST_FPS)",255,255,255,255)
}
}
class Player_input {
static controls() {
var done = false
Game.dude.moving = false
if (Input.is_key_held(Input.get_keycode("W")) && Game.dude.on_ground && !done) { //Jump
Game.dude.moving = true
Game.dude.vy = Game.dude.jump_force
Game.dude.on_ground = false
done = true
}
if (Input.is_key_held(Input.get_keycode("D")) && Input.is_key_held(Input.get_keycode("A")) && !done) { //Move Right
Game.dude.moving = false
done = true
}
if (Input.is_key_held(Input.get_keycode("A")) && !done) { //Move Right
Game.dude.x = Game.dude.x - Game.dude.speed
Game.dude.moving = true
Game.dude.sprite_direction="Left"
done = true
}
if (Input.is_key_held(Input.get_keycode("D")) && !done) { //Move left
Game.dude.x = Game.dude.x + Game.dude.speed
Game.dude.moving = true
Game.dude.sprite_direction="Right"
done = true
}
if (Input.is_key_held(Input.get_keycode("L"))) { //Safe Shutdown
Engine.destroy()
}
}
}
class Floor {
static draw() {
Draw.rectangle(0, FLOOR_Y,WIDTH, FLOOR_HEIGHT,0, 200, 0, 255, true)
}
