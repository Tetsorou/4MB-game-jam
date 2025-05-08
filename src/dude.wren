class Guy {
  //getters
  moving {_moving}
  sprite_path {_sprite_path} //animation variables
  sprites {_sprites} //animation variables
  sprite_key {_sprite_key} //animation variables
  sprite_last {_sprite_last} //animation variables
  sprite_index {_sprite_index} //animation variables
  sprite_direction {_sprite_direction} //animation variables
  width {_width}
  height {_height}
  x {_x}
  y {_y}
  speed {_speed}
  gravity {_gravity}
  on_ground {_on_ground}
  vy {_vy} // velocidad en y
  jump_force {_jump_force}
  current_sprite {_current_sprite}
  sprite_map {_sprite_map}

  //setters
  sprite_path=(value) {_path = value}  //animation variables
  sprites=(value) {_sprites = value}  //animation variables
  sprite_index=(value) {_sprite_index=value} //animation variables
  sprite_direction=(value) {_sprite_direction=value} //animation variables
  sprite_key=(value) {_sprite_key=value} //animation variables
  sprite_last=(value) {_sprite_last=value} //animation variables
  x=(value) {_x= value}
  y=(value){_y= value}
  on_ground=(value) {_on_ground = value}
  vy=(value) {_vy = value} 
  jump_force=(value) {_jump_force = value}
  current_sprite=(value) {_current_sprite = value}
  moving=(value) {_moving = value}
  //  sprite_map=(value) {_sprite_map = value}

construct new(x1,y1,width1,height1,path,smap) {
    _sprite_path = path
    _x = x1
    _y = y1
    _width = width1
    _height = height1
    // _sprites = Surface.new_from_png(sprite_path)
    _vy = 0
    _speed = 1
    _jump_force = -10
    _on_ground = false
    _gravity = 0.3
    _sprites = smap
    _sprite_index = 1
    _sprite_direction="Right"
    _sprite_last = ""
    _sprite_map = {}
  }

  draw(current_sprite_param) {
    
    if (!sprite_map.containsKey(current_sprite_param)) {
       _sprite_map[current_sprite_param] = Surface.new_from_png(current_sprite_param)
       
    }
    
    Surface.draw(sprite_map[current_sprite_param],x,y,1)
    
  }

  animation () {
     if (moving) {
        sprite_key="Walk"
    } else {
        sprite_key="Idle"
    }
    // Seleccion de sprite
    var main = Fiber.current
    var fiber = Fiber.new{ |value|       
      if ((FPS) % 10  == 0) {
        sprite_index= sprite_index + 1
      }
      if (sprite_index > sprites[sprite_key]) {
        sprite_index= 1   
      }
      
      main.transfer("%(sprite_path)%(sprite_key)%(sprite_index)%(sprite_direction).png")
    }

    var proceed = sprite_last == sprite_key
   
    if (sprite_last != sprite_key) {
        sprite_last = sprite_key
        sprite_direction = sprite_direction
        sprite_index = 1
    }
    current_sprite = fiber.transfer(proceed)
  }
  physics() {
   
    vy = vy + gravity
    y = y + vy
    // System.print("vy: %(vy) + %(gravity)")
    // System.print("y: %(y) + %(vy)")
    if (y  >= Game.floor.y - height ) {
      y = Game.floor.y  - height +2
      vy = 0.0
      on_ground = true
    } else {
      on_ground = false
    }
    if (x  < 0 ) {
      x = 0 
    }
    if (x  > WIDTH - width ) {
      x = WIDTH -width
    }
    if (y < 0) {
      y = 0 
      vy = 0.0
    }
  }

}
