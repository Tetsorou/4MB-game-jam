
var TOOL = "" 
var TILE_TYPE = ""
var TILE_TYPE_MATERIAL = ""

class Player_input {

  static controls() {
    var a =""
    if (Input.is_key_held(Input.get_keycode("P"))) {
        TOOL = "PLACE"
    }
   
    if (Input.is_key_held(Input.get_keycode("L"))) { //Safe Shutdown
      // LOGS.close()
      Level_maker.save_file()
      OUTPUT.close()
      Engine.destroy()
    }
    
    if (TOOL == "PLACE") {
      if (Input.is_key_held(Input.get_keycode("A")) ) {
          TILE_TYPE= "Floor"
      } 
      if (Input.is_key_held(Input.get_keycode("S")) ) {
          TILE_TYPE= "Wall"
      } 
      if (Input.is_key_held(Input.get_keycode("D")) ) {
          TILE_TYPE= "Ceiling"
      } 
      if (Input.is_key_held(Input.get_keycode("F")) ) {
          TILE_TYPE= "Top_corner"
      } 
      if (Input.is_key_held(Input.get_keycode("G")) ) {
          TILE_TYPE= "Bottom_corner"
      } 
      if (Input.is_key_held(Input.get_keycode("H")) ) {
          TILE_TYPE= "Inside_corner"
      } 
      // System.print(TILE_TYPE)
      // Tile_type_material
      if (Input.is_key_held(Input.get_keycode("Q")) ) {
          TILE_TYPE_MATERIAL = "GRASS"
      } 
      if (Input.is_key_held(Input.get_keycode("W"))) {
          TILE_TYPE_MATERIAL = "BRICK"
      } 
      if (Input.is_key_held(Input.get_keycode("E")) ) {
          TILE_TYPE_MATERIAL = "DIRT"
      } 
      // System.print(TILE_TYPE_MATERIAL)

      //Generating the surfaces
      if (Input.is_key_pressed(Keycodes.LEFT)) {
        if (TILE_TYPE== "Ceiling") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              a = Ceiling.new(Ceiling.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              a = Ceiling.new(Ceiling.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
                a = Ceiling.new(Ceiling.DIRT,Input.mouse_x(),Input.mouse_y())
                a.draw()  
          }
        }
        if (TILE_TYPE== "Floor") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              a = Floor.new(Floor.GRASS,Input.mouse_x(),Input.mouse_y())
              System.print(a.surface)
              a.draw()  
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              a = Floor.new(Floor.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()   
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              a = Floor.new(Floor.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()   
          }
        }
        if (TILE_TYPE== "Top_corner") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              a = Top_corner.new(Top_corner.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              a = Top_corner.new(Top_corner.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              a = Top_corner.new(Top_corner.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw() 
          }
        }
        if (TILE_TYPE== "Bottom_corner") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              a = Bottom_corner.new(Bottom_corner.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()    
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              a = Bottom_corner.new(Bottom_corner.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()    
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
            a = Bottom_corner.new(Bottom_corner.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
        }
        if (TILE_TYPE== "Inside_corner") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              a = Inside_corner.new(Inside_corner.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()  
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              a = Inside_corner.new(Inside_corner.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              a = Inside_corner.new(Inside_corner.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
          }
        }
        if (TILE_TYPE== "Wall") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              a = Wall.new(Wall.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()  
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
                a = Wall.new(Wall.BRICK,Input.mouse_x(),Input.mouse_y())
                a.draw()  
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              a = Wall.new(Wall.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()   
          }
        }
        if (TILE_TYPE_MATERIAL && TILE_TYPE) {
            BLOCK_MAP[a.surface] = "a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"   
            POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
        }
      } 
            
    }

   
    
  }
}