characterspec = require("characterspec")

require("pl.class").enemy(characterspec)


enemy.name = "gfx/enemy.png"
enemy.speed = 2*100
enemy.direction =-1

function enemy:_init(y)
	self:super()
	self.loc = vector(20, y)
end

function enemy:update(dt)
	if self.loc.x < 0 then
		self.direction = 1
		self.loc.x = 0
	elseif self.loc.x + self.image:getWidth() > gameX then
		self.direction = -1
		self.loc.x = gameX - self.image:getWidth()
	end
	self.loc.x = self.loc.x +  self.direction * dt * self.speed
end

return enemy