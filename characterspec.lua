Character = {}

vector = require "hump/vector"

function Character:new()
	o = {
		name = nil,
		image = nil,
		loc = vector(0,0)
	}
	self.__index = self
	return setmetatable(o, self)
end

function Character:draw()
	love.graphics.draw(self.image, self.loc.x, self.loc.y)
end

function Character:center(x, y)
	self.loc.x = x - self.image:getWidth()/2
	self.loc.y = y - self.image:getHeight()/2
end

function Character:load()
	print(self.name)
	self.image = love.graphics.newImage(self.name)
	print(self.image)	
end

return Character