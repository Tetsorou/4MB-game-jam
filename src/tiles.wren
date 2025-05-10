
class Tiles {

    static tile {__tile}
    static tile_materials {__tile_materials}
    static all_sprites {__all_sprites}

    // tile_materials[tile_type] = (materials) { _tile_materials[tile_type] = materials}
    // all_sprites[tile_type_material] = (surface_id) {_all_sprites[tile_type_material] = surface_id}


    static init() {
        __tile_materials = {}
        __all_sprites = {}
        __tile = []
        init_tile_materials()
        var loops = 0
        for (map in tile_materials) {
            var i = 0
            while (map.value.count > i) {
                var surface = Surface.new_from_png("%(map.key)/%(map.value[i]).png")  
                all_sprites["%(map.key)/%(map.value[i])"] = surface

                i = i + 1
            }
            tile.insert(loops,map.key)
            loops = loops + 1
        }
    }
    static init_tile_materials() {
        tile_materials["bottom_corner"]= ["grass","dirt","brick"]
        tile_materials["wall"]= ["grass","dirt","brick"]
        tile_materials["top_corner"]= ["grass","dirt","brick"]
        tile_materials["inside_corner"]= ["grass","dirt","brick"]
        tile_materials["floor"]= ["grass","dirt","brick"]
        tile_materials["decoration"]= ["grass","grass2"]
        tile_materials["ceiling"]= ["grass","dirt","brick"]
    }
    
}