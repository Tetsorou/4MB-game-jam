
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

  sprite_last_dir {_sprite_last_dir}
  sprite_last_dir=(value) {_sprite_last_dir = value}




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
    _ia_interval = 2 // segundos para cambiar de direccion
    _sprite_last_dir = ""
    _dt = 0

    _sprite_last_dir = ""
    _dt = 0
    _state = "idle"         
    _state_timer = 0 


  }

  draw(current_sprite_param) {
    if (!_sprite_map.containsKey(current_sprite_param)) {
      System.print(current_sprite_param)
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
  //no se que esto :v

  var main = Fiber.current
  var fiber = Fiber.new {
    if ((FPS % 10) == 0) {
      sprite_index = sprite_index + 1
    }

    if (sprite_index > sprites[sprite_key]) {
      sprite_index = 1
    }

    var ruta = sprite_path + sprite_key + sprite_index.toString + sprite_direction + ".png"
    main.transfer(ruta)
  }

  var proceder = false
  if (sprite_last == sprite_key && sprite_last_dir == sprite_direction) {
    proceder = true
  }

  if (!proceder) {
    sprite_last = sprite_key
    sprite_last_dir = sprite_direction
    sprite_index = 1
  }

  current_sprite = fiber.transfer()
}
auto_move() {
  var guy_x = Game.dude.x
  var distance_to_guy = (guy_x - x).abs

  // Actualizar temporizador de estado (por frames)
  if (_state_timer > 0) _state_timer = _state_timer - 1

  if (_state == "flee") {
    // Huir durante 3 segundos (180 frames a 60 FPS)
    moving = true
    if (_sprite_direction == "Right") {
      x = Math.min(x + _speed, WIDTH - _width)
    } else {
      x = Math.max(x - _speed, 0)
    }
    if (_state_timer == 0) {
      _state = "observe"
      _state_timer = 90 // observar 1.5 segundos (90 frames)
      moving = false
    }
    return
  }

  if (_state == "observe") {
    // Solo mirar al jugador
    moving = false
    if (guy_x > x) {
      _sprite_direction = "Right"
    } else {
      _sprite_direction = "Left"
    }
    if (_state_timer == 0) {
      _state = "seek"
      _state_timer = 120 // buscar durante 2 segundos (120 frames)
    }
    return
  }

  if (_state == "seek") {
    // Buscar al jugador
    moving = true
    if (guy_x > x) {
      _sprite_direction = "Right"
      x = Math.min(x + 2, WIDTH - _width)
    } else {
      _sprite_direction = "Left"
      x = Math.max(x - 2, 0)
    }
    if (_state_timer == 0) {
      _state = "idle"
      _state_timer = 60 // quedarse quieto 1 segundo (60 frames)
      moving = false
    }
    return
  }

  // Estado idle o inicial
  moving = false
  if (distance_to_guy <= 20) {
    // Si esta muy cerca, huir en direccion opuesta
    if (guy_x > x) {
      _sprite_direction = "Left"
    } else {
      _sprite_direction = "Right"
    }
    _speed = 6
    _state = "flee"
    _state_timer = 180 // huir 3 segundos (180 frames)
    return
  }

  // Si no esta cerca, mirar al jugador
  if (guy_x > x) {
    _sprite_direction = "Right"
  } else {
    _sprite_direction = "Left"
  }
}

/*auto_move() {
  var guy_x = Game.dude.x
  var distance_to_guy = (guy_x - x).abs

  // Comportamiento dependiendo de la distancia
  if (distance_to_guy > 80) {
    // Muy lejos: correr hacia el jugador
    if (guy_x > x) {
      _sprite_direction = "Right"
    } else {
      _sprite_direction = "Left"
    }
    _speed = 8  // correr
  } else if (distance_to_guy > 50) {
    // Lejos: caminar hacia el jugador
    if (guy_x > x) {
      _sprite_direction = "Right"
    } else {
      _sprite_direction = "Left"
    }
    _speed = 2  // caminar
  } else if (distance_to_guy <= 20) {
    // Muy cerca: alejarse rapido
    if (guy_x > x) {
      _sprite_direction = "Left"
    } else {
      _sprite_direction = "Right"
    }
    _speed = 3  // correr en sentido opuesto
  } else {
    // Zona media: comportamientos aleatorios
    var accion = (Random.rand() * 4).floor
    if (accion == 0) {
      _sprite_direction = "Left"
      _speed = 5
    } else if (accion == 1) {
      _sprite_direction = "Right"
      _speed = 5
    } else if (accion == 2) {
      // Salta si hay gravedad o salto disponible
      //if (is_on_ground) jump()  // asegurese de tener esto definido
    } else {
      // Se queda quieto un momento
      moving = false
      return
    }
  }

  // Movimiento con validacion de limites
  moving = true
  if (_sprite_direction == "Right") {
    x = Math.min(x + _speed, WIDTH - _width)
  } else {
    x = Math.max(x - _speed, 0)
  }
}*/

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