function drawGame()
  love.graphics.setBackgroundColor(0.1, 0.1, 0.1)

  love.graphics.setColor(1,1,1)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth() , 50)
  love.graphics.setColor(0,0,0)
  love.graphics.print(score1.." : "..score2, love.graphics.getWidth()/2-10, 5)
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle("fill", 0, love.graphics.getHeight()-50, love.graphics.getWidth(), 50)
  love.graphics.rectangle("fill", player.x, player.y, 25 , 200)
  love.graphics.rectangle("fill", player2.x, player2.y, 25 , 200)
  love.graphics.circle("fill", ball.x, ball.y, 20)
end

function movePlayer1()
  if love.keyboard.isDown("w") and player.y > 50 then
    player.y = player.y - player.speed
  end
  if love.keyboard.isDown("s") and player.y + 200 < love.graphics.getHeight()-50 then
    player.y = player.y + player.speed
  end
end

function moveBall()
  ball.x = ball.x + ball.speed * ball.dx
  ball.y = ball.y + ball.speed * ball.dy

  if ball.x-20 <= player.x+25 and ball.y >= player.y and ball.y <= player.y+200 then
    ball.dx = 1
    ball.dy = love.math.random(-0.5,0.5)
  end

  if ball.x+20 >= player2.x-25 and ball.y >= player2.y and ball.y <= player2.y + 200 then
    ball.dx = -1
    ball.dy = love.math.random(-0.5,0.5)
  end

  if ball.y-20 <= 50 or ball.y+20 >= love.graphics.getHeight()-50 then
    ball.dy = ball.dy * -1
  end

  if ball.x <= 0 then
    win = 2
    score2 = score2 + 1
    ball.x = love.graphics.getWidth()/2
    ball.y = love.graphics.getHeight()/2
    ball.dx = -1
    ball.dy = 0
    player.x = 50
    player.y = (love.graphics.getHeight()/2)-100
    player2.x = love.graphics.getWidth()-50
    player2.y = (love.graphics.getHeight()/2)-100
  end

  if ball.x >= love.graphics.getWidth() then
    win = 1
    score1 = score1 + 1
    ball.x = love.graphics.getWidth()/2
    ball.y = love.graphics.getHeight()/2
    ball.dx = -1
    ball.dy = 0
    player.x = 50
    player.y = (love.graphics.getHeight()/2)-100
    player2.x = love.graphics.getWidth()-50
    player2.y = (love.graphics.getHeight()/2)-100
  end
end

function playerAI()
  if ball.y > player2.y+100 and player2.y + 200 < love.graphics.getHeight()-50 then
    player2.y = player2.y + player2.speed
  end
  if ball.y < player2.y+100 and player2.y > 50 then
    player2.y = player2.y - player2.speed
  end
end

function updatemenu(dt)
  if love.mouse.isDown(1) then
    local x,y = love.mouse.getX(), love.mouse.getY()
    if x>love.graphics.getWidth()/10 and y>=love.graphics.getHeight()/2 and y<=love.graphics.getHeight()/2+200 and x<(love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) then
      screen = "game"
    else if x>love.graphics.getWidth()/10 and y>=love.graphics.getHeight()/2+300  and y<=love.graphics.getHeight()/2+500 and x<(love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) then
      love.event.quit()
      end
    end
  end
end

function drawMenu()
  local x, y = love.mouse.getPosition()
  love.graphics.setBackgroundColor(0.1, 0.1, 0.1)

  love.graphics.setFont(menuFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("POBG", love.graphics.getWidth()/2-65, 200)
  if x >= love.graphics.getWidth()/10 and y>=love.graphics.getHeight()/2 and x <= (love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) and y<=love.graphics.getHeight()/2+200 then
    love.graphics.setColor(0.5, 0.5, .5)
  else
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()/10, love.graphics.getHeight()/2, love.graphics.getWidth()-love.graphics.getWidth()/5, 200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Start", love.graphics.getWidth()-love.graphics.getWidth()/2-55 , love.graphics.getHeight()/2+75)
  if x >= love.graphics.getWidth()/10 and y>=love.graphics.getHeight()/2+300 and x <= (love.graphics.getWidth()/10)+(love.graphics.getWidth()-love.graphics.getWidth()/5) and y<=love.graphics.getHeight()/2+500 then
    love.graphics.setColor(0.5, 0.5, 0.5)
  else
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.rectangle("fill", love.graphics.getWidth()/10, love.graphics.getHeight()/2 + 300, love.graphics.getWidth()-love.graphics.getWidth()/5, 200)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Quit", love.graphics.getWidth()-love.graphics.getWidth()/2-50 , love.graphics.getHeight()/2+375)
end

function won()
  if score1 == 5 or score2 == 5 then
    screen = "win"
  end
end

function updateWin()

end

function drawWin()
  drawGame()
  love.graphics.setColor(1,1,1,0.5)
  love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
  love.graphics.setColor(0, 0, 0)
  if score1 == 5 then
    love.graphics.print("Player 1 won!",love.graphics.getWidth()/2-150, love.graphics.getHeight()/2-50)
  else
    love.graphics.print("Player 2 won!",love.graphics.getWidth()/2-150, love.graphics.getHeight()/2-50)
  end
end
