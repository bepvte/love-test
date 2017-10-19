PhysicsBody = require("physicsbody")
player = PhysicsBody()

player.name = "gfx/player.png"
player.speed = 40

function player:update(dt)
	PhysicsBody.update(self, dt)
end

return player