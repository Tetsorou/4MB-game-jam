
var BLOCK_MAP_1 = {-1:null}
 class Level_test_1 { 
static level() { 
      var a = "" 
for (map in BLOCK_MAP_1 ) { 
if (38 > BLOCK_MAP_1.count || map.key == -1) {
BLOCK_MAP_1.remove(-1)
a=Floor.new(Floor.GRASS,124,57)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(124, 57)
a=Floor.new(Floor.DIRT,290,78)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(290, 78)
a=Wall.new(Wall.BRICK,215,141)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(215, 141)
a=Floor.new(Floor.DIRT,276,79)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(276, 79)
a=Floor.new(Floor.GRASS,208,96)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(208, 96)
a=Inside_corner.new(Inside_corner.BRICK,79,76)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(79, 76)
a=Inside_corner.new(Inside_corner.BRICK,139,133)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(139, 133)
a=Ceiling.new(Ceiling.BRICK,200,132)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(200, 132)
a=Floor.new(Floor.DIRT,116,64)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(116, 64)
a=Floor.new(Floor.GRASS,145,95)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(145, 95)
a=Floor.new(Floor.GRASS,196,93)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(196, 93)
a=Wall.new(Wall.GRASS,235,74)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(235, 74)
a=Wall.new(Wall.GRASS,245,141)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(245, 141)
a=Ceiling.new(Ceiling.GRASS,250,49)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(250, 49)
a=Bottom_corner.new(Bottom_corner.GRASS,232,31)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(232, 31)
a=Inside_corner.new(Inside_corner.BRICK,81,98)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(81, 98)
a=Ceiling.new(Ceiling.BRICK,86,78)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(86, 78)
a=Wall.new(Wall.BRICK,144,59)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(144, 59)
a=Floor.new(Floor.DIRT,179,81)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(179, 81)
a=Ceiling.new(Ceiling.BRICK,226,100)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(226, 100)
a=Floor.new(Floor.GRASS,175,125)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(175, 125)
a=Floor.new(Floor.GRASS,124,24)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(124, 24)
a=Floor.new(Floor.GRASS,127,81)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(127, 81)
a=Wall.new(Wall.GRASS,244,99)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(244, 99)
a=Ceiling.new(Ceiling.GRASS,183,42)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(183, 42)
a=Ceiling.new(Ceiling.GRASS,283,51)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(283, 51)
a=Inside_corner.new(Inside_corner.GRASS,275,21)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(275, 21)
a=Inside_corner.new(Inside_corner.BRICK,114,121)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(114, 121)
a=Ceiling.new(Ceiling.BRICK,130,106)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(130, 106)
a=Floor.new(Floor.DIRT,134,77)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(134, 77)
a=Wall.new(Wall.BRICK,179,106)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(179, 106)
a=Floor.new(Floor.GRASS,201,72)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(201, 72)
a=Wall.new(Wall.GRASS,246,122)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(246, 122)
a=Ceiling.new(Ceiling.GRASS,232,48)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(232, 48)
a=Top_corner.new(Top_corner.GRASS,191,30)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(191, 30)
a=Floor.new(Floor.DIRT,221,82)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(221, 82)
a=Ceiling.new(Ceiling.BRICK,160,127)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(160, 127)
a=Wall.new(Wall.BRICK,245,143)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(245, 143)
}   else {
Surface.draw(map.key,BLOCK_MAP_1[map.key].x,BLOCK_MAP_1[map.key].y,255 )
}
}
}
}
