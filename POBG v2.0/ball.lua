Ball = Entity:extend()

function Ball:new(x,y, radius)
  Ball.super.new(self,x,y)
  self.radius = radius
  self.speedx = 800
end

function Ball:update(dt)
  self.x = self.x + self.speedx * dt
  self.y = self.y + self.speedy * dt

  if (self.x-25 <= leftPad.x+25 and self.y >= leftPad.y and self.y <= leftPad.y+200) or (self.x+20 >= rightPad.x-25 and self.y >= rightPad.y and self.y <= rightPad.y + 200) then
    self.speedx = self.speedx * -1
    self.speedy = love.math.random(-500,500)
  end
  if self.y+25 >= love.graphics.getHeight() or self.y-25 <= 0 then
    self.speedy = self.speedy * -1
  end
end

function Ball:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Ball:out()
  if self.x-25 <= 0 then
    score2 = score2 + 1
    ball = Ball(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 25)
  elseif self.x+25 >= love.graphics.getWidth() then
    score1 = score1 + 1
    ball = Ball(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 25)
  else

  end
end
