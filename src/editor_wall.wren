
class Wall is Block{
static DIRT{"wall/dirt.png"}    
static BRICK{"wall/brick.png"}    
static GRASS{"wall/grass.png"}    
construct new(path,x1,y1) {
  _x = x1
  _y = y1 //y1
  _surface= Surface.new_from_png(path)
  _width = Surface.get_width(surface)
  _height = Surface.get_height(surface)
  } 
}
