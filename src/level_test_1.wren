
var BLOCK_MAP_1 = {-1:null}
 class Level_test_1 { 
static level() { 
      var a = "" 
for (map in BLOCK_MAP_1 ) { 
if (5 > BLOCK_MAP_1.count || map.key == -1) {
BLOCK_MAP_1.remove(-1)
a=Floor.new(Floor.GRASS,78,111)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(78, 111)
a=Floor.new(Floor.GRASS,84,67)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(84, 67)
a=Floor.new(Floor.GRASS,136,101)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(136, 101)
a=Floor.new(Floor.GRASS,159,23)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(159, 23)
a=Floor.new(Floor.GRASS,87,80)

a.draw()
BLOCK_MAP_1[a.surface] = Vector.new(87, 80)
}   else {
Surface.draw(map.key,BLOCK_MAP_1[map.key].x,BLOCK_MAP_1[map.key].y,255 )
}
}
}
}
