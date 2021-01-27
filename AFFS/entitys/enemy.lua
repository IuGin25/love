Enemy = Entity:extend()

function Enemy:new(x,y,width,height)
  Enemy.super.new(self, x, y, width, height)
  self.speedx = love.math.random(-50,50)
  self.speedy = love.math.random(400, 1000)
  self.y = 0
  self.x = love.math.random(0, maxx)
  self.isEnemy = true
  self.image = love.graphics.newImage("ananas.png")
end

function Enemy:update(i, dt)
  local goalX = self.x + self.speedx * dt
  local goalY = self.y + self.speedy *dt
  local actualX, actualY, cols, len = world:move(enemys[i], goalX, goalY)
  self.x, self.y = actualX, actualY
  for y = 1, len do
    local other = cols[y].other
    if other.isPlayer then
      screen = "fail"
    elseif other.isGround then
      enemys[i].ground = true
    end
  end
end

local playerFilter = function(item, other)
  if other.isEnemy then
    return 'slide'
  elseif other.isPlayer then
    return 'slide'
  elseif other.isGround then
    return 'slide'
  else
     return nil
  end
end

function Enemy:draw()
  love.graphics.draw(self.image, self.x, self.y, 0, 1, 1)
end
