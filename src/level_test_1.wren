
class Level_test { 
    static level_position {__level_position}
    static relative_level_id {__relative_level_id}
    static level_position_id {__level_position_id}

    static init() {
    __level_position = {}
    __level_position_id = {}
    __relative_level_id = {}
}
static draw_from_map() {
if (relative_level_id.count >= 1) {
for (map in relative_level_id) {
Surface.draw(Tiles.all_sprites[map.value], level_position[map.key].x  ,level_position[map.key].y ,255)
}
}
}
}
