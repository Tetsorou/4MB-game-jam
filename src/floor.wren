
class Floor {
static DIRT{"floor/dirt.png"}    
static BRICK{"floor/brick.png"}    
static GRASS{"floor/grass.png"}  
height {_height}
  width {_width}
  x {_x}
  y {_y}
  surface {_surface}
  width=(value) {_width = value}
  height=(value) {_height = value}
  x=(value) {_x= value}
  y=(value){_y= value}
  surface=(value) {_surface=value}

  draw() {Surface.draw(surface,x,y,255)}  
construct new(path,x1,y1) {
  _x = x1
  _y = y1 //y1
  _surface= Surface.new_from_png(path)
  _width = Surface.get_width(surface)
  _height = Surface.get_height(surface)
  } 
}