function love.load()
  love.window.setFullscreen(true)
  love.graphics.setBackgroundColor(0.15, 0.15, 0.15)
  Object = require "classic"
  require "entity"
  require "pad"
  require "ball"
  leftPad = Pad(50, love.graphics.getHeight()/2-100, 25, 200, "w", "s")
  rightPad = Pad(love.graphics.getWidth()-75, love.graphics.getHeight()/2-100, 25, 200, "up", "down")
  ball = Ball(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 25)

  score1 = 0
  score2 = 0

  font = love.graphics.newFont(50)
end

function love.update(dt)
  leftPad:update(dt)
  rightPad:update(dt)
  ball:update(dt)
  ball:out()

  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end

function love.draw()
  love.graphics.setFont(font)
  leftPad:draw()
  rightPad:draw()
  ball:draw()
  love.graphics.print(score1.." - "..score2, love.graphics.getWidth()/2-50, 25)
end
