
class Block { 
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
  construct new(path,x1,y1) {} 
  draw() {Surface.draw(surface,x,y,0)}
}