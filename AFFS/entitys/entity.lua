Entity = Object:extend()

function Entity:new(x,y,width,height)
  self.x = x
  self.y = y
  self.speedx = 0
  self.speedy = 0
  self.width = width
  self.height = height
end
