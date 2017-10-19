PhysicsBody = require("physicsbody")
player = PhysicsBody()

player.name = "gfx/player.png"
player.speed = 40

function player:update(dt)
	cols = PhysicsBody.update(self, dt)
	for i = 1, #cols do
		if cols[i].other.is_a(enemy) then
			gamestate.switch(require('over'))
		end
	end
end

return player