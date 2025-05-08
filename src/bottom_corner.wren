
class Bottom_corner is Block{
static DIRT{"bottom_corner/dirt.png"}    
static BRICK{"bottom_corner/brick.png"}    
static GRASS{"bottom_corner/grass.png"}    
construct new(path,x1,y1) {
  _x = x1
  _y = y1 //y1
  _surface= Surface.new_from_png(path)
  _width = Surface.get_width(surface)
  _height = Surface.get_height(surface)
  } 
}
