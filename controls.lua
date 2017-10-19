return {
	['w'] = function(c, dt) c.loc.y = c.loc.y - 100 * dt end,
	['a'] = function(c, dt) c.loc.x = c.loc.x - 100 * dt end,
	['s'] = function(c, dt) c.loc.y = c.loc.y + 100 * dt end,
	['d'] = function(c, dt) c.loc.x = c.loc.x + 100 * dt end,
	['q'] = function() love.event.quit() end
}