-- Game scale

scale = 2
function love.conf(t)
  t.title = "Taint"
  t.screen.width = 480 * scale
  t.screen.height = 320 * scale
end