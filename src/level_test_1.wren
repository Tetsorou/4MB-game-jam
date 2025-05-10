
class Level_test { 
    static level_position {__level_position}
    static relative_level_id {__relative_level_id}
    static level_position_id {__level_position_id}

    static init() {
    __level_position = {}
    __level_position_id = {}
    __relative_level_id = {}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(148, 84)
if (__level_position_id.containsKey("(148, 84)")) {
__level_position_id["(148, 84)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(148, 84)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(210, 116)
if (__level_position_id.containsKey("(210, 116)")) {
__level_position_id["(210, 116)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(210, 116)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(265, 104)
if (__level_position_id.containsKey("(265, 104)")) {
__level_position_id["(265, 104)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(265, 104)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(221, 113)
if (__level_position_id.containsKey("(221, 113)")) {
__level_position_id["(221, 113)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(221, 113)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(85, 126)
if (__level_position_id.containsKey("(85, 126)")) {
__level_position_id["(85, 126)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(85, 126)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(169, 130)
if (__level_position_id.containsKey("(169, 130)")) {
__level_position_id["(169, 130)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(169, 130)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(250, 98)
if (__level_position_id.containsKey("(250, 98)")) {
__level_position_id["(250, 98)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(250, 98)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(173, 52)
if (__level_position_id.containsKey("(173, 52)")) {
__level_position_id["(173, 52)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(173, 52)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(187, 106)
if (__level_position_id.containsKey("(187, 106)")) {
__level_position_id["(187, 106)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(187, 106)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(109, 83)
if (__level_position_id.containsKey("(109, 83)")) {
__level_position_id["(109, 83)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(109, 83)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(223, 124)
if (__level_position_id.containsKey("(223, 124)")) {
__level_position_id["(223, 124)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(223, 124)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(249, 113)
if (__level_position_id.containsKey("(249, 113)")) {
__level_position_id["(249, 113)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(249, 113)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(270, 118)
if (__level_position_id.containsKey("(270, 118)")) {
__level_position_id["(270, 118)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(270, 118)"] = __level_position_id.count
}
__relative_level_id[__relative_level_id.count]="ceiling/grass"
__level_position[__level_position.count] = Vector.new(177, 103)
if (__level_position_id.containsKey("(177, 103)")) {
__level_position_id["(177, 103)"].insert(__level_position_id.count,__level_position_id.count)
} else {
__level_position_id["(177, 103)"] = __level_position_id.count
}
}
static draw_from_map() {
if (relative_level_id.count >= 1) {
for (map in relative_level_id) {
Surface.draw(Tiles.all_sprites[map.value], level_position[map.key].x  ,level_position[map.key].y ,255)
}
}
}
}
