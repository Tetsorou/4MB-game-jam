
var TOOL = "" 
var TILE_TYPE = ""
var TILE_TYPE_MATERIAL = ""

class Player_input {

  static controls() {
    if (TOOL == null) {
        TOOL = ""
    }
    if (TILE_TYPE== null) {
        TILE_TYPE= ""
    }
    if (TILE_TYPE_MATERIAL == null) {
        TILE_TYPE_MATERIAL = ""
    }
     if (Input.is_key_held(Input.get_keycode("P"))) {
        TOOL = "PLACE"
    }
      // System.print(TOOL)
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
              var a = Ceiling.new(Ceiling.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
              BLOCK_MAP[a.surface] = "a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"   
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              var a = Ceiling.new(Ceiling.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"  
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              var a = Ceiling.new(Ceiling.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
        }
        if (TILE_TYPE== "Floor") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              var a = Floor.new(Floor.GRASS,Input.mouse_x(),Input.mouse_y())
              Surface.draw(Surface.new_from_png(Floor.GRASS),Input.mouse_x(),Input.mouse_y(),1)
              System.print(a.surface)
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
              // System.print("mouse_x: %(Input.mouse_x())")
              // System.print("mouse_y: %(Input.mouse_y())")
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              var a = Floor.new(Floor.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              var a = Floor.new(Floor.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
        }
        if (TILE_TYPE== "Top_corner") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              var a = Top_corner.new(Top_corner.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              var a = Top_corner.new(Top_corner.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              var a = Top_corner.new(Top_corner.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
        }
        if (TILE_TYPE== "Bottom_corner") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              var a = Bottom_corner.new(Bottom_corner.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              var a = Bottom_corner.new(Bottom_corner.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              var a = Bottom_corner.new(Bottom_corner.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
        }
        if (TILE_TYPE== "Inside_corner") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              var a = Inside_corner.new(Inside_corner.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              var a = Inside_corner.new(Inside_corner.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              var a = Inside_corner.new(Inside_corner.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
        }

        if (TILE_TYPE== "Wall") {
          if (TILE_TYPE_MATERIAL == "GRASS") {
              var a = Wall.new(Wall.GRASS,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "BRICK") {
              var a = Wall.new(Wall.BRICK,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
          if (TILE_TYPE_MATERIAL == "DIRT") {
              var a = Wall.new(Wall.DIRT,Input.mouse_x(),Input.mouse_y())
              a.draw()
              POSITION_MAP[a.surface] = Vector.new(a.x,a.y)
              BLOCK_MAP[a.surface]="a=%(TILE_TYPE).new(%(TILE_TYPE).%(TILE_TYPE_MATERIAL),%(a.x),%(a.y))\n"     
          }
        }
      } 
            
    }

   
    
  }
}