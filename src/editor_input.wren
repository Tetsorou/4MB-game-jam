
var TOOL = "PLACE"
var TILE_INDEX = 0
var MATERIAL_INDEX = 0
var ID = 1
var LAYER = 0

class Player_input {

  static controls() {
    var a =""
    if (Input.is_key_pressed(Input.get_keycode("P"))) {
        TOOL = "PLACE"
        // System.print(Tiles.tile_materials)
        System.print(Physics.id_position)
        System.print(Physics.position)

    }
    if (Input.is_key_held(Input.get_keycode("L"))) { //Safe Shutdown
      // LOGS.close()
      Level_maker.save_file()
      OUTPUT.close()
      Engine.destroy()
    }
    
    if (TOOL == "PLACE") {
        if (Input.is_key_pressed(Input.get_keycode("Q"))) {
            TILE_INDEX = TILE_INDEX + 1 
        }
        if (Input.is_key_pressed(Input.get_keycode("E"))) {
            MATERIAL_INDEX = MATERIAL_INDEX + 1 
            // System.print(MATERIAL_INDEX)
        }
        if(TILE_INDEX >= Tiles.tile.count || TILE_INDEX < 0 ) {
            TILE_INDEX = 0
        }
        if(MATERIAL_INDEX >= Tiles.tile_materials[Tiles.tile[TILE_INDEX]].count || MATERIAL_INDEX < 0 ) {
            MATERIAL_INDEX = 0
        }
        if (Input.is_key_pressed(Keycodes.LEFT)) {
            Physics.relative_id[ID]="%(Tiles.tile[TILE_INDEX])/%(Tiles.tile_materials[Tiles.tile[TILE_INDEX]][MATERIAL_INDEX])"
            // System.print("%(Tiles.tile[TILE_INDEX])/%(Tiles.tile_materials[Tiles.tile[TILE_INDEX]][MATERIAL_INDEX])")
            Physics.position[ID] = Vector.new((Input.mouse_x()/8).floor * 8, (Input.mouse_y()/8).floor * 8)
            // System.print("mouse pos: %(Input.mouse_pos())")
            if (Physics.id_position.containsKey("%((Input.mouse_x()/8).floor * 8), %((Input.mouse_y()/8).floor * 8)")) {
                var b = Physics.id_position["%((Input.mouse_x()/8).floor * 8), %((Input.mouse_y()/8).floor * 8)"][LAYER]
                Physics.id_position["%((Input.mouse_x()/8).floor * 8), %((Input.mouse_y()/8).floor * 8)"][LAYER] = ID
                Physics.position.remove(b)
                Physics.relative_id.remove(b)
            } else {
                Physics.id_position["%((Input.mouse_x()/8).floor * 8), %((Input.mouse_y()/8).floor * 8)"] = [ID]
                // what happens when an empty layer sits in between say, layer 0 and 2
            }
            ID = ID + 1
        }
        
    }
            
  }
}