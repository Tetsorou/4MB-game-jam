
class Ceiling is Block{
static DIRT{"ceiling/dirt.png"}    
static BRICK{"ceiling/brick.png"}    
static GRASS{"ceiling/grass.png"}    
construct new(path,x1,y1) {
  _x = x1
  _y = y1 //y1
  _surface= Surface.new_from_png(path)
  _width = Surface.get_width(surface)
  _height = Surface.get_height(surface)
  } 
}
