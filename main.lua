require "TEsound"

function love.load()
  world = love.physics.newWorld(0, 0, 650, 650)
  world:setGravity(0, 700)
  world:setMeter(64)
  objects = {}
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 650/2, 400, 0, 0)
  objects.ground.shape = love.physics.newRectangleShape(objects.ground.body, 0, 0, 650, 50, 0)
  objects.dog = {}
  objects.dog.body = love.physics.newBody(world, 650/2, 650/2, 15, 0)
  objects.dog.shape = love.physics.newCircleShape(objects.dog.body, 0, 0, 20)
  objects.boy = {}
  objects.boy.body = love.physics.newBody(world, 200, 350, 15, 0)
  objects.boy.shape = love.physics.newRectangleShape(objects.boy.body, 0, 0, 60, 60, 0)
  objects.npc = {}
  objects.npc.body = love.physics.newBody(world, 500, 350, 15, 0)
  objects.npc.shape = love.physics.newRectangleShape(objects.npc.body, 0, 0, 60, 60, 0)
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.setMode(650, 650, false, true, 0)
end

function love.update(dt)
  TEsound.cleanup()
  world:update(dt)
  if love.keyboard.isDown("right") then
    objects.boy.body:applyForce(400,0)
  elseif love.keyboard.isDown("left") then
    objects.boy.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    objects.boy.body:setY(200)
  elseif love.keyboard.isDown("space") then
    
  end
end

function love.mousereleased(x, y, button)
  if button == '1' then
    love.graphics.print("mouse", 400, 400)
    
  end
end

function love.draw()
  love.graphics.setColor(72, 160, 14)
  love.graphics.polygon("fill", objects.ground.shape:getPoints())
  love.graphics.setColor(192, 47, 14)
  love.graphics.circle("fill", objects.dog.body:getX(), objects.dog.body:getY(), objects.dog.shape:getRadius(), 20)
  love.graphics.setColor(200, 160, 14)
  love.graphics.polygon("fill", objects.boy.shape:getPoints())
  love.graphics.setColor(192, 47, 14)
  love.graphics.polygon("fill", objects.npc.shape:getPoints())
end

function love.focus(f)
  if not f then
    print("LOST FOCUS")
  else
    print("GAINED FOCUS")
  end
end