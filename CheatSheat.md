# make editor 
## Tiles.wren

### Tiles.tile()
    - Returns a list with all the tile types
    - ["Floor", "Wall", "Corner"] 
### Tiles.tile_materials
    - Returns a map that takes a tile as a key and returns a list of all available materials for that tile
    - {"Wall" : ["grass","dirt","brick"], "Decoration" : ["grass", "grass2"]}
### Tiles.all_sprites
    - Returns a map of tile type merged with type material and a surfaceID
    - {"Floor/grass":12}
  - This getter is really useful, since it lets you draw a tile, without having to create a new one: 
  ``` wren
    Surface.draw(Tiles.all_srpites["Ceiling/brick"], 0,0,255)
  ```
### Tiles.init()
    -   Initializes all the surfaces and stores their IDs in all_sprites
### Tiles.init_type_materials()
    -   you can add or remove tiles, materials and possibly more
## Player_input (editor_input.wren)

### Controls()
    - P: selects the place tool, the only currently available tool
    - Q: cicles the tile types
    - E: cicles the tile type materials
    - L: Quit and save
    - LEFT ARROW: place block 
## Level_test_1.wren

### Level_test.level_position
    returns a map like: <relative_ID>:Vector(x,y)
    example: { 1:(12, 30), 2:(100, 40), 3:(200,20) }
### Level_test.level_position_id
    returns a map like: (x, y): [<relative_ID_1>, <relative_ID_2> ,...,<relative_ID_N>]
    example: {"(12, 30)": [1,4,34,102,103], "(100, 40)": [2,10,12,30,78] }
### Level_test.relative_level_id
     returns a map like: <relative_ID>:<Tile_type_and_material>
    example: { 1:"Wall/dirt", 2:"Wall/dirt", 3:"Decoration/grass2" }

