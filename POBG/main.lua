require "AI"

function love.load()
  love.window.setFullscreen(true)

  screen = "menu"
  ball = {}
  ball.x = love.graphics.getWidth()/2
  ball.y = love.graphics.getHeight()/2
  ball.speed = 1000
  ball.dx = -1
  ball.dy = 0

  player = {}
  player.x = 50
  player.y = (love.graphics.getHeight()/2)-100
  player.speed = 450

  player2 = {}
  player2.x = love.graphics.getWidth()-50
  player2.y = (love.graphics.getHeight()/2)-100
  player2.speed = 400

  menuFont = love.graphics.newFont(40)

  score1 = 0
  score2 = 0
end

function love.update(dt)

  if screen == "menu" then
    updatemenu()
  elseif screen == "game" then
    movePlayer1(dt)
    moveBall(dt)
    playerAI(dt)
    won()
  else
    updateWin()
  end

  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end

function love.draw()
  if screen == "menu" then
    drawMenu()
  elseif screen == "game" then
    drawGame()
  else
    drawWin()
  end
end
