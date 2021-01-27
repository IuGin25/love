Player = Entity:extend()

function Player:new(x, y, width, height, speedx, speedy)
  Player.super.new(self,x,y,width,height)
  self.speedx = speedx
  self.speedy = speedy
  self.isPlayer = true
  image = love.graphics.newImage("p.png")
end


function Player:move(dt)
  if love.keyboard.isDown("d") then
    local goalX = self.x + self.speedx *dt
    local actualX, actualY, cols, len = world:move(player, goalX, player.y,playerFilter)
    self.x, self.y = actualX, actualY
    for i = 1, len do
      local other = cols[i].other
      if other.isEnemy then
        screen = "fail"
      end
    end
  elseif love.keyboard.isDown("a") then
    local goalX = self.x - self.speedx *dt
    local actualX, actualY, cols, len = world:move(player, goalX, player.y, playerFilter)
    self.x, self.y = actualX, actualY
    for i = 1, len do
      local other = cols[i].other
      if other.isEnemy then
        screen = "fail"
      end
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

function Player:draw()
  love.graphics.draw(image, self.x, self.y, 0, 1, 1)
end
