class Enemy {
  // Getters
  moving {_moving}
  sprite_path {_sprite_path}
  sprites {_sprites}
  sprite_key {_sprite_key}
  sprite_last {_sprite_last}
  sprite_index {_sprite_index}
  sprite_direction {_sprite_direction}
  width {_width}
  height {_height}
  x {_x}
  y {_y}
  speed {_speed}
  gravity {_gravity}
  on_ground {_on_ground}
  vy {_vy}
  jump_force {_jump_force}
  current_sprite {_current_sprite}
  sprite_map {_sprite_map}

  // Setters
  sprite_path=(value) {_path = value}
  sprites=(value) {_sprites = value}
  sprite_index=(value) {_sprite_index = value}
  sprite_direction=(value) {_sprite_direction = value}
  sprite_key=(value) {_sprite_key = value}
  sprite_last=(value) {_sprite_last = value}
  x=(value) {_x = value}
  y=(value) {_y = value}
  on_ground=(value) {_on_ground = value}
  vy=(value) {_vy = value}
  jump_force=(value) {_jump_force = value}
  current_sprite=(value) {_current_sprite = value}
  moving=(value) {_moving = value}

  // Constructor
  construct new(x1, y1, width1, height1, path, smap) {
    _sprite_path = path
    _x = x1
    _y = y1
    _width = width1
    _height = height1
    _vy = 0
    _speed = 1
    _jump_force = -5
    _on_ground = false
    _gravity = 0.3
    _sprites = smap
    _sprite_index = 1
    _sprite_direction = "Right"
    _sprite_last = ""
    _sprite_map = {}
    _ia_timer = 0
    _ia_interval = 2 // segundos para cambiar de dirección
  }

  draw(current_sprite_param) {
    if (!_sprite_map.containsKey(current_sprite_param)) {
      _sprite_map[current_sprite_param] = Surface.new_from_png(current_sprite_param)
    }
    Surface.draw(_sprite_map[current_sprite_param], x, y, 1)
  }

  animation() {
    if (moving) {
      sprite_key = "Walk"
    } else {
      sprite_key = "Idle"
    }

    // Selección de sprite
    var main = Fiber.current
    var fiber = Fiber.new {
      while (true) {
        if ((FPS) % 10 == 0) {
          sprite_index = sprite_index + 1
        }
        if (sprite_index > sprites[sprite_key]) {
          sprite_index = 1
        }
        main.transfer("%(sprite_path)%(sprite_key)%(sprite_index)%(sprite_direction).png")
      }
    }

    var proceed = sprite_last == sprite_key

    if (!proceed) {
      sprite_last = sprite_key
      sprite_index = 1
    }
    current_sprite = fiber.transfer(proceed)
  }

auto_move(dt) {
  _ia_timer = _ia_timer + dt

  if (_ia_timer >= _ia_interval) {
    // Obtener la posición del personaje Guy
    var guy_x = Game.dude.x
    var distance_to_guy = (guy_x - x).abs // Distancia absoluta al personaje

    // Cambiar dirección en función de la distancia al personaje
    if (distance_to_guy > 50) { // Si está lejos, acercarse
      if (guy_x > x) {
        _sprite_direction = "Right"
      } else {
        _sprite_direction = "Left"
      }
    } else if (distance_to_guy <= 20) { // Si está muy cerca, alejarse
      if (guy_x > x) {
        _sprite_direction = "Left"
      } else {
        _sprite_direction = "Right"
      }
    } else {
      // Si está a una distancia intermedia, moverse aleatoriamente
      if ((Random.next * 2).floor == 0) {
        _sprite_direction = "Left"
      } else {
        _sprite_direction = "Right"
      }
    }

    _ia_timer = 0
  }

  // Movimiento con validación de límites
  moving = true
  if (_sprite_direction == "Right") {
    x = Math.min(x + _speed, Game.WIDTH - _width)
  } else {
    x = Math.max(x - _speed, 0)
  }
}
  physics() {
    /*vy = vy + _gravity
    y = y + vy

    // Colisiones con el suelo
    if (y >= Game.floor.y - _height) {
      y = Game.floor.y - _height
      vy = 0.0
      on_ground = true
    } else {
      on_ground = false
    }

    // Límites de la pantalla
    if (x < 0) {
      x = 0
    }
    if (x > WIDTH - _width) {
      x = WIDTH - _width
    }
    if (y < 0) {
      y = 0
      vy = 0.0
    }*/
  }
}