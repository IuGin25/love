function love.load()
  maxx = love.graphics.getWidth()
  maxy = love.graphics.getHeight()
  Object = require "classic"
  require "entitys/entity"
  require "entitys/player"
  require "entitys/enemy"
  bump = require "bump"
  player = Player(maxx/2-50,maxy-250, 100, 100, 400, 400)
  ground = Entity(0,maxy-150,maxx,150)
  ground.isGround = true
  timer = 0
  enemys = {}
  world = bump.newWorld()
  world:add(player,player.x,player.y,player.width,player.height)
  world:add(ground,0,maxy-150,maxx,150)
  screen = "game"

  ground = love.graphics.newImage("ground.jpg")
  back = love.graphics.newImage("back.jpg")
  iunut_urland = love.audio.newSource("iunut_urland.wav", 'static')
end

function love.update(dt)

  if screen == "game" then
    player:move(dt)

    if love.math.random(0,100) < 3 then
      table.insert(enemys, Enemy(0,0,65, 100))
      world:add(enemys[#enemys], enemys[#enemys].x, enemys[#enemys].y, enemys[#enemys].width, enemys[#enemys].height)
    end

    for i = 1, #enemys-1 do
      if enemys[i] then
        enemys[i]:update(i,dt)
        if enemys[i].ground then
          world:remove(enemys[i])
          table.remove(enemys, i)
        end
      end
    end

    if love.keyboard.isDown("escape") then
      love.event.quit()
    end
  elseif screen == "fail" then
    love.audio.play(iunut_urland)
    love.timer.sleep(4)
    love.event.quit()
  end
end

function love.draw()
  if screen == "game" then
    love.graphics.draw(back, 0, 0, 0, 1, 1)
    love.graphics.draw(ground, 0, maxy-150, 0, 3, 3)
    player:draw()
    for i = 1,#enemys do
      enemys[i]:draw()
    end
  end
end
