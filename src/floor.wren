
class Floor is Block {
static DIRT{"floor/dirt.png"}    
static BRICK{"floor/brick.png"}    
static GRASS{"floor/grass.png"}    
construct new(path,x1,y1) {
  _x = x1
  _y = y1 //y1
  _surface= Surface.new_from_png(path)
  _width = Surface.get_width(surface)
  _height = Surface.get_height(surface)
  } 
}