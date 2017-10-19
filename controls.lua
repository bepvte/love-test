vector = require "hump/vector"

return {
	['w'] = function(c, dt) c.acc = c.acc + vector(0, -1 * c.speed * dt) end,
	['a'] = function(c, dt) c.acc = c.acc + vector(-1 * c.speed * dt, 0) end,
	['s'] = function(c, dt) c.acc = c.acc + vector(0, 1 * c.speed * dt) end,
	['d'] = function(c, dt) c.acc = c.acc + vector(1 * c.speed * dt, 0) end,
	['q'] = function() love.event.quit() end
}