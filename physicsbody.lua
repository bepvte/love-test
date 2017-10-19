characterspec = require "characterspec"

vector = require "hump/vector"

PhysicsBody = {}
setmetatable(PhysicsBody, {__index = characterspec})

function PhysicsBody:new() 
	inst = characterspec:new()

	inst.acc = vector.new(0,0) 
	inst.vel = vector.new(0,0)
	inst.friction = 0.6
	inst.gravity = 0.6
	inst.weight = 10

	self.__index = self
		
	return setmetatable(inst, self)
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
	self.loc = self.loc + self.vel
	self.acc.x, self.acc.y = 0, 0
end

function PhysicsBody:center(x, y)
	characterspec.center(self, x, y)
	self.vel.x, self.vel.y = 0, 0
end

return PhysicsBody