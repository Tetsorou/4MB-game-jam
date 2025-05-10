
var OUTPUT = FileIO.open("level_test_1.wren", "w")
// var MAP_ID =
class Level_maker {
    static save_file() {
        OUTPUT.write("\n")
        OUTPUT.write("class level_test { \n")
        OUTPUT.write("    static level_position {__level_position}\n")
        OUTPUT.write("    static relative_level_id {__relative_level_id}\n")
        OUTPUT.write("    static level_position_id {__level_position_id}\n")
        OUTPUT.write("\n")
        OUTPUT.write("    static init() {\n")
        OUTPUT.write("    __level_position = {}")
        OUTPUT.write("    __level_position_id = {}")
        OUTPUT.write("    __relative_level_id = {}")
        for (map in Physics.relative_id) {
            OUTPUT.write("__relative_level_id[__relative_level_id.count]=\"%(map.value)\"\n")
            OUTPUT.write("__level_position[__level_position.count] = Vector.new%(Physics.position[map.key])\n")

            OUTPUT.write("if (__level_position_id.containsKey[\"%(Physics.position[map.key])\"]) {\n")
                OUTPUT.write("__level_position_id[\"%(Physics.position[map.key])\"].insert(__level_position_id.count,__level_position_id.count)\n")
            OUTPUT.write("} else {\n")
                OUTPUT.write("__level_position_id[\"%(Physics.position[map.key])\"] = __level_position_id.count\n")
            OUTPUT.write("}\n")
        }
    OUTPUT.write("}\n")
    OUTPUT.write("static draw_from_map() {\n")
        OUTPUT.write("if (relative_level_id.count >= 1) {\n")
            OUTPUT.write("for (map in relative_level_id) {\n")
             OUTPUT.write("Surface.draw(Tiles.all_sprites[map.value], level_position[map.key].x  ,level_position[map.key].y ,255)\n")
            OUTPUT.write("}\n")
        OUTPUT.write("}\n")
    OUTPUT.write("}\n")
OUTPUT.write("}\n")
        
       
    }
    static draw_from_map() {
        if (Physics.relative_id.count >= 1) {
            for (map in Physics.relative_id) {
             Surface.draw(Tiles.all_sprites[map.value], Physics.position[map.key].x  ,Physics.position[map.key].y ,255)
            }
        }
        
    }


}