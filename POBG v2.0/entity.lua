Entity = Object:extend()

function Entity:new(x,y)
  self.x = x
  self.y = y
  self.speedx = 400
  self.speedy = 0
end
