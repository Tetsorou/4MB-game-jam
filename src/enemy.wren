/*class Enemy {
  // Variables internas del enemigo
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
  sprite_last_dir {_sprite_last_dir}

  // Setters para propiedades privadas
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
  sprite_last_dir=(value) {_sprite_last_dir = value}

  // Constructor de la clase Enemy
  construct new(x1, y1, width1, height1, path, smap) {
    _sprite_path = path
    _x = x1
    _y = y1
    _width = width1
    _height = height1
    _vy = 0
    _speed = 2
    _jump_force = -5
    _on_ground = true
    _gravity = 0.4
    _sprites = smap
    _sprite_index = 1
    _sprite_direction = "Right"
    _sprite_last = ""
    _sprite_map = {}
    _ia_timer = 0
    _ia_interval = 2
    _sprite_last_dir = ""
    _dt = 0

    _state = "idle"
    _state_timer = 0
    _teleport_cooldown = 0
    _jump_timer = 0
    _jump_cooldown = 60

    _charge_timer = 0
    _charge_direction = 0

    _moving = false
    _sprite_key = ""
    _current_sprite = null
    _sprite_last_dir = ""
  }

  // Dibuja el sprite actual en pantalla
  draw(current_sprite_param) {
    if (!_sprite_map.containsKey(current_sprite_param)) {
      _sprite_map[current_sprite_param] = Surface.new_from_png(current_sprite_param)
    }
    Surface.draw(_sprite_map[current_sprite_param], x, y, 1)
  }

  // Controla la animacion del sprite
  animation() {
    if (moving) {
      sprite_key = "Walk"
    } else {
      sprite_key = "Idle"
    }

    var main = Fiber.current
    var fiber = Fiber.new {
      if ((FPS % 8) == 0) {
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

  // Teletransporte cerca de la espalda del personaje principal
  teleport_behind_player() {
    var dude = Game.dude
    var offset = 30
    var new_x

    if (dude.x > x) {
      new_x = dude.x - offset
      _sprite_direction = "Right"
    } else {
      new_x = dude.x + offset
      _sprite_direction = "Left"
    }

    // Limita la posicion dentro del ancho de pantalla
    if (new_x < 0) new_x = 0
    if (new_x > WIDTH - _width) new_x = WIDTH - _width

    _x = new_x
    _y = y
  }

  // Inicia ataque de embestida
  start_charge() {
    _state = "charge"
    _state_timer = 30
    _charge_timer = 20
    if (_sprite_direction == "Right") {
      _charge_direction = 1
    } else {
      _charge_direction = -1
    }
    _sprite_key = "Attack"
    moving = true
  }

  // Ataque generico falso
  attack_fake() {
    _sprite_key = "Attack"
    _state_timer = 20
    moving = false
  }

  // Salta si esta en el suelo
  jump() {
    if (on_ground) {
      vy = jump_force
      on_ground = false
    }
  }

  // Comportamiento automatico del enemigo
  auto_move() {
    var guy_x = Game.dude.x
    var distance_to_guy = (guy_x - x).abs

    if (_state_timer > 0) {
      _state_timer = _state_timer - 1
    }

    if (_teleport_cooldown > 0) {
      _teleport_cooldown = _teleport_cooldown - 1
    } else {
      if (Random.rand() < 0.01) {
        teleport_behind_player()
        start_charge()
        _teleport_cooldown = 200
        return
      }
    }

    if (_jump_timer > 0) {
      _jump_timer = _jump_timer - 1
    } else {
      if (Random.rand() < 0.05) {
        jump()
        _jump_timer = _jump_cooldown
      }
    }

    if (_state == "charge") {
      x = x + (_charge_direction * 5)
      if (_state_timer == 0) {
        _state = "idle"
        _sprite_key = "Idle"
        moving = false
      }
      return
    }

    if (_state == "flee") {
      moving = true
      if (_sprite_direction == "Right") {
        x = x + (_speed * 0.7)
        if (x > WIDTH - _width) {
          x = WIDTH - _width
        }
      } else {
        x = x - (_speed * 0.7)
        if (x < 0) {
          x = 0
        }
      }

      if (_state_timer == 0) {
        _state = "observe"
        _state_timer = 60
        moving = false
      }
      return
    }

    if (_state == "observe") {
      moving = false
      if (guy_x > x) {
        _sprite_direction = "Right"
      } else {
        _sprite_direction = "Left"
      }

      if (_state_timer == 0) {
        _state = "seek"
        _state_timer = 100
      }
      return
    }

    if (_state == "seek") {
      moving = true
      if (guy_x > x) {
        _sprite_direction = "Right"
        x = x + _speed
        if (x > WIDTH - _width) {
          x = WIDTH - _width
        }
      } else {
        _sprite_direction = "Left"
        x = x - _speed
        if (x < 0) {
          x = 0
        }
      }

      if (distance_to_guy <= 30) {
        if (Random.rand() < 0.1) {
          _state = "attack"
          attack_fake()
          return
        }
      }

      if (_state_timer == 0) {
        _state = "idle"
        _state_timer = 40
        moving = false
      }
      return
    }

    if (_state == "attack") {
      if (_state_timer == 0) {
        _state = "idle"
        _state_timer = 20
        _sprite_key = "Idle"
      }
      return
    }

    // Estado por defecto (idle)
    moving = false

    if (distance_to_guy <= 25) {
      if (guy_x > x) {
        _sprite_direction = "Left"
      } else {
        _sprite_direction = "Right"
      }

      _speed = 4
      _state = "flee"
      _state_timer = 100
      return
    }

    if (guy_x > x) {
      _sprite_direction = "Right"
    } else {
      _sprite_direction = "Left"
    }
  }

  // Aqui puedes agregar gravedad u otras fisicas si quieres
  physics() {
    
  }
}*/
class Enemy {
  // Atributos del enemigo
  moving         {_moving}
  sprite_path    {_sprite_path}
  sprites        {_sprites}
  sprite_key     {_sprite_key}
  sprite_last    {_sprite_last}
  sprite_index   {_sprite_index}
  sprite_direction {_sprite_direction}
  width          {_width}
  height         {_height}
  x              {_x}
  y              {_y}
  speed          {_speed}
  gravity        {_gravity}
  on_ground      {_on_ground}
  vy             {_vy}
  jump_force     {_jump_force}
  current_sprite {_current_sprite}
  sprite_map     {_sprite_map}
  sprite_last_dir {_sprite_last_dir}

  // Setters
  sprite_path=(value) {_sprite_path = value}
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
  sprite_last_dir=(value) {_sprite_last_dir = value}

  // Constructor
  construct new(x1, y1, width1, height1, path, smap) {
    _sprite_path = path
    _x = x1
    _y = y1
    _width = width1
    _height = height1
    _vy = 0
    _speed = 2
    _jump_force = -5
    _on_ground = true
    _gravity = 0.4
    _sprites = smap
    _sprite_index = 1
    _sprite_direction = "Right"
    _sprite_last = ""
    _sprite_map = {}
    _sprite_last_dir = ""
    _ia_timer = 0
    _ia_interval = 2

    _state = "idle"
    _state_timer = 0
    _teleport_cooldown = 0
    _jump_timer = 0
    _jump_cooldown = 60

    _moving = false
    _sprite_key = ""
    _current_sprite = null
  }

  // Metodo para dibujar el sprite
  draw(current_sprite_param) {
    if (!_sprite_map.containsKey(current_sprite_param)) {
      _sprite_map[current_sprite_param] = Surface.new_from_png(current_sprite_param)
    }
    Surface.draw(_sprite_map[current_sprite_param], x, y, 1)
  }

  // Metodo de animacion
  animation() {
    if (moving) {
      sprite_key = "Walk"
    } else {
      sprite_key = "Idle"
    }

    var main = Fiber.current
    var fiber = Fiber.new {
      if ((FPS % 8) == 0) { // Usar FPS como contador global de frames
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

  // Teletransporte aleatorio
  teleport_random() {
    var new_x = (Random.rand() * (WIDTH - _width)).floor
    var new_y = y
    _x = new_x
    _y = new_y
  }

  // Teletransporte arriba del personaje
  teleport_above_player() {
    var guy_x = Game.dude.x
    var guy_y = Game.dude.y
    _x = guy_x
    _y = guy_y - 50
  }

  // Teletransporte por la espalda
  teleport_behind_player() {
    var guy_x = Game.dude.x
    if (Game.dude.direction == "Right") {
      _x = guy_x - 40
      _sprite_direction = "Right"
    } else {
      _x = guy_x + 40
      _sprite_direction = "Left"
    }
    _y = Game.dude.y
  }

  // Ataque falso
  attack_fake() {
    _sprite_key = "Attack"
    _state_timer = 20
    moving = false
  }

  // Salto
  jump() {
    if (on_ground) {
      vy = jump_force
      on_ground = false
    }
  }

  // Movimiento automatico del enemigo
  auto_move() {
    var guy_x = Game.dude.x
    var guy_y = Game.dude.y
    var distance_x = (guy_x - x).abs
    var distance_y = (guy_y - y).abs

    // Cooldown de acciones
    if (_teleport_cooldown > 0) {
      _teleport_cooldown = _teleport_cooldown - 1
    }

    if (_jump_timer > 0) {
      _jump_timer = _jump_timer - 1
    }

    if (_state_timer > 0) {
      _state_timer = _state_timer - 1
    }

    // Teletransporte estrategico
    if (_teleport_cooldown == 0) {
      if (Random.rand() < 0.005) {
        teleport_above_player()
        _teleport_cooldown = 120
        return
      }
      if (Random.rand() < 0.005) {
        teleport_behind_player()
        _teleport_cooldown = 120
        _state = "dash"
        _state_timer = 20
        return
      }
      if (Random.rand() < 0.003) {
        teleport_random()
        _teleport_cooldown = 120
        return
      }
    }

    // Salto aleatorio
    if (_jump_timer == 0 && Random.rand() < 0.03) {
      jump()
      _jump_timer = _jump_cooldown
    }

    // Dash despues de teletransporte
    if (_state == "dash") {
      moving = true
      if (_sprite_direction == "Right") {
        x = x + (_speed * 2)
      } else {
        x = x - (_speed * 2)
      }
      if (_state_timer == 0) {
        _state = "idle"
        moving = false
      }
      return
    }

    // Estados IA clasicos
    if (_state == "idle") {
      moving = false
      if (_state_timer == 0) {
        _state = "observe"
        _state_timer = 40
      }
      return
    }

    if (_state == "observe") {
      moving = false
      if (guy_x > x) {
        _sprite_direction = "Right"
      } else {
        _sprite_direction = "Left"
      }
      if (_state_timer == 0) {
        _state = "seek"
        _state_timer = 100
      }
      return
    }

    if (_state == "seek") {
      moving = true
      if (guy_x > x) {
        _sprite_direction = "Right"
        x = x + _speed
      } else {
        _sprite_direction = "Left"
        x = x - _speed
      }

      if (distance_x < 30 && Random.rand() < 0.1) {
        _state = "attack"
        attack_fake()
        return
      }

      if (_state_timer == 0) {
        _state = "idle"
        _state_timer = 40
        moving = false
      }
      return
    }

    if (_state == "attack") {
      if (_state_timer == 0) {
        _state = "idle"
        _state_timer = 20
        _sprite_key = "Idle"
      }
      return
    }
  }

  // Fisicas del enemigo
  physics() {
    // 
  }
}