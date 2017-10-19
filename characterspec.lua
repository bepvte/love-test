Character = {}

vector = require "hump/vector"

function Character:new()
	local newObj = {
		name = nil,
		image = nil, 
		loc = vector.new(0,0), 
		acc = vector.new(0,0), 
		vel = vector.new(0,0)
	}
	self.__index = self
	return setmetatable(newObj, self)
end

function Character:draw()
	love.graphics.draw(self.image, self.loc.x, self.loc.y)
end

function Character:center(x, y)
	self.loc.x = x - self.image:getWidth()/2
	self.loc.y = y - self.image:getHeight()/2
	self.vel.x, self.vel.y = 0, 0
end

function Character:load()
	self.image = love.graphics.newImage(self.name)
end

function Character:update(dt)
	self.vel + self.acc
	self.loc + self.vel
	self.acc.x, self.acc.y = 0,0
end
return Character