
var BLOCK_MAP = {}
var POSITION_MAP = {}
var OUTPUT = FileIO.open("level_test_1.wren", "w")
// var MAP_ID =
class Level_maker {
    static save_file() {
        OUTPUT.write("\n")
        OUTPUT.write("var BLOCK_MAP_1 = {-1:null}\n")
        OUTPUT.write(" class Level_test_1 { \n")
        OUTPUT.write("static level() { \n")
        OUTPUT.write("      var a = \"\" \n")
        OUTPUT.write("for (map in BLOCK_MAP_1 ) { \n") 
            OUTPUT.write("if (%(BLOCK_MAP.count) > BLOCK_MAP_1.count || map.key == -1) {\n")
            OUTPUT.write("BLOCK_MAP_1.remove(-1)\n")
            for (map in BLOCK_MAP) { // true loop
                OUTPUT.write("%(map.value)\n")
                OUTPUT.write("a.draw()\n")
                OUTPUT.write("BLOCK_MAP_1[a.surface] = Vector.new%(POSITION_MAP[map.key])\n")
        } // true loop
        OUTPUT.write("}   ")
        OUTPUT.write("else {\n")
        OUTPUT.write("Surface.draw(map.key,BLOCK_MAP_1[map.key].x,BLOCK_MAP_1[map.key].y,255 )\n")
        OUTPUT.write("}\n") 
    OUTPUT.write("}\n")
    OUTPUT.write("}\n")  
    OUTPUT.write("}\n")  
       
    }
    static draw_from_map() {
        if (Physics.relative_id.count >= 1) {
            for (map in Physics.relative_id) {
            // System.print("------------------------")
             Surface.draw(Tiles.all_sprites[map.value], Physics.position[map.key].x  ,Physics.position[map.key].y ,255)

            }
        }
        
    }


}