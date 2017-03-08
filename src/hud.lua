local hud = {}

local function update(hud, health)
   hud.lives = health
end

local function draw(hb,player)
    love.graphics.print({{0,0,0},love.timer.getFPS()}, 0, 0) -- Print instantaneous FPS
    love.graphics.print({{0,0,0},player.hasObject and "Move those Computers!" or "Go grab another server" }, love.graphics.getWidth()/2, 0)
    love.graphics.print({{0,0,0},"Score: " .. player.score}, love.graphics.getWidth()/2, love.graphics.getHeight()*.15)

   -- Print player's lives
   local x, y = hb.x, hb.y
   love.graphics.setColor(219, 78, 78)
   for i=1, hb.lives do
      love.graphics.rectangle('fill', x, y, 15, 15)
      x = x + 20
   end

   if player.health < 1 then
      love.graphics.print({{0,0,0},'Dead'}, love.graphics.getWidth()/2, love.graphics.getHeight()/3)
   end
end

function hud.create(health, x, y)
   local inst = {}
   inst.x = x
   inst.y = y
   inst.lives = health

   inst.draw = draw
   inst.update = update
   return inst
end

return hud