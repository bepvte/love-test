characterspec = require "characterspec"

class = require "pl.class"
vector = require "hump/vector"

class.PhysicsBody(characterspec)

function PhysicsBody:_init()
	self:super()
	self.acc = vector.new(0,0) 
	self.vel = vector.new(0,0)
	self.friction = 0.6
	self.gravity = 0.6
	self.weight = 10
end

function PhysicsBody:draw()
	characterspec.draw(self)
	if os.getenv("DEBUG") then
		love.graphics.setColor(255,0,0)
		local x, y = (self.loc + self.vel):unpack()
		love.graphics.circle("fill", x + self.image:getWidth()/2, y + self.image:getHeight()/2, 10)
	end
end

function PhysicsBody:update(dt)
	self.vel = self.vel * self.friction
	self.vel = self.vel + (self.acc * self.weight)
	local goalX, goalY = (self.loc + self.vel):unpack()
	self.acc.x, self.acc.y = 0, 0
	local actualX, actualY, cols, _ = world:move(self, goalX, goalY)
	self.loc.x = actualX
	self.loc.y = actualY
	return cols
end

function PhysicsBody:center(x, y)
	characterspec.center(self, x, y)
	self.vel.x, self.vel.y = 0, 0
end

return PhysicsBody