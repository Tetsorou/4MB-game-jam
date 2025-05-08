
var BLOCK_MAP = {}
var POSITION_MAP = {}
var OUTPUT = FileIO.open("level_test_1.wren", "w")
class Level_maker {
    static save_file() {
        OUTPUT.write("\n")
        OUTPUT.write("class Level_test_1 { \n")
        OUTPUT.write("  level() { \n")
        
        //Iterate over BLOCK_MAP
        //and add a.draw()
        //and a check if the surfaceid that the method in BLOCK_MAP
        // is already in the level_test_1 own map, it will then reference that one
        //instead of creating a new one



        // OUTPUT.write("  }\n")
        // OUTPUT.write("}\n")

    }
    static draw_from_map() {
        for (map in BLOCK_MAP ) {
            Surface.draw(map.key,POSITION_MAP[map.key].x,POSITION_MAP[map.key].y,1)
            
        }
    }


}