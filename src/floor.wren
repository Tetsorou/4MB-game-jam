
class Floor {
  width {_width}
  x {_x}
  y {_y}
  height {_height}
  surface {_surface}
  index {_index}

  width=(value) {_width = value}
  height=(value) {_height = value}
  x=(value) {_x= value}
  y=(value){_y= value}
  surface=(value) {_surface=value}
  index=(value) {_index=value}


  construct new(path,x1,y1) {
  _x = x1
  _y = HEIGHT - y1 //y1
  _surface= Surface.new_from_png("dirt/dirt2.png")
  // System.print("%(path)2.png")
  _width = Surface.get_width(surface)
  _height = Surface.get_height(surface)
  _index = 0

  } 
  draw() {
    while (WIDTH > (index * width) ) {
      Surface.draw(surface,x + (index * width),y,255)
      index = index + 1
    }
    index = 0
    // Surface.draw(surface,x,y)
    // Draw.rectangle(0, FLOOR_Y,WIDTH, FLOOR_HEIGHT,0, 200, 0, 255, true)
  }
}