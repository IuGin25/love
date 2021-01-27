Pad = Entity:extend()

function Pad:new(x,y,width,height, keyUp, keyDown)
  Pad.super.new(self,x,y)
  self.width = width
  self.height = height
  self.keyUp = keyUp
  self.keyDown = keyDown
  self.speedy = 400
end

function Pad:update(dt)
  if love.keyboard.isDown(self.keyUp) and self.y>= 0 then
    self.y = self.y - self.speedy * dt
  elseif love.keyboard.isDown(self.keyDown) and self.y + 200 <= love.graphics.getHeight() then
    self.y = self.y + self.speedy * dt
  end
end

function Pad:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
