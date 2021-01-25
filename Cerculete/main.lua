function love.load()
  button = {}
  button.x = 200
  button.y = 200
  button.size = 50

  score = 0
  timer = 5000

  font = love.graphics.newFont(30)
  menuFont = love.graphics.newFont(50)

  screen = "menu"

  love.window.setMode(1500, 1000, {resizable=true, vsync=false, minwidth=1000, minheight=750})
end

function love.update(dt)
  if screen == "menu" then
    updatemenu()
    score = 0
    timer = 5000
  elseif screen == "game" then
      timer= timer - 1

      if love.keyboard.isDown("escape") then
        screen = "menu"
      end

      if timer<=0 then
        screen = "fail"
      end
  else
    updatemenu()
    score = 0
    timer = 5000
  end
end

function updatemenu(dt)
  if love.mouse.isDown(1) then
    local x,y = love.mouse.getX(), love.mouse.getY()
    if x>love.graphics.getWidth()/10 and y>=300 and y<=500 and x<(love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) then
      screen = "game"
    else if x>love.graphics.getWidth()/10 and y>=600  and y<=800 and x<(love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) then
      love.event.quit()
      end
    end
  end
end

function love.draw()
  if screen == "menu" then
    drawMenu()
  elseif screen == "game" then
    drawGame()
  else
    drawFail()
  end
end

function drawMenu()
  local x, y = love.mouse.getPosition()
  love.graphics.setFont(menuFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("APASA PE PATRATELE JOC 2021", love.graphics.getWidth()/4, 100)
  if x >= love.graphics.getWidth()/10 and y>=300 and x <= (love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) and y<=500 then
    love.graphics.setColor(1, 0, 1)
  else
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()/10, 300, love.graphics.getWidth()-love.graphics.getWidth()/5, 200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Start", love.graphics.getWidth()-love.graphics.getWidth()/2-55 , 375)
  if x >= love.graphics.getWidth()/10 and y>=600 and x <= (love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) and y<=800 then
    love.graphics.setColor(1, 0, 1)
  else
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()/10, 600, love.graphics.getWidth()-love.graphics.getWidth()/5, 200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Quit", love.graphics.getWidth()-love.graphics.getWidth()/2-50 , 675)

end

function drawGame()
  love.graphics.setColor(1, 0, 1)
  love.graphics.circle("fill", button.x, button.y, button.size)

  love.graphics.setFont(font)
  love.graphics.setColor(1,1,1)
  love.graphics.print("Score: "..score)
  love.graphics.print("Timer: "..string.format("%d",timer/500), 0, 30)
end

function drawFail()
  local x, y = love.mouse.getPosition()
  love.graphics.setFont(menuFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("ESTI PROST!", love.graphics.getWidth()/2.525, 100)
  if x >= love.graphics.getWidth()/10 and y>=300 and x <= (love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) and y<=500 then
    love.graphics.setColor(1, 0, 1)
  else
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()/10, 300, love.graphics.getWidth()-love.graphics.getWidth()/5, 200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Restart", love.graphics.getWidth()-love.graphics.getWidth()/2-55 , 375)
  if x >= love.graphics.getWidth()/10 and y>=600 and x <= (love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) and y<=800 then
    love.graphics.setColor(1, 0, 1)
  else
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()/10, 600, love.graphics.getWidth()-love.graphics.getWidth()/5, 200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Quit", love.graphics.getWidth()-love.graphics.getWidth()/2-50 , 675)

end

function love.mousepressed(x, y, b, isTouch)
  if b == 1 then
    if(distance(button.x, x, button.y, y) <= button.size)then
      score = score + 1
      timer = timer + 500

      button.size = love.math.random(10,200)
      button.x = love.math.random(button.size,love.graphics.getWidth()-button.size)
      button.y = love.math.random(button.size,love.graphics.getHeight()-button.size)
    else
      timer = timer - 500
    end
  end
end

function distance(x1, x2, y1, y2)
  return math.sqrt((x2-x1)^2+(y2-y1)^2)
end
