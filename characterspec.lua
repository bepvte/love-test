class = require "pl.class"

class.Character()

vector = require "hump/vector"

function Character:_init()
	self.name = nil
	self.image = nil
	self.loc = vector(0,0)
end

function Character:draw()
	love.graphics.draw(self.image, self.loc.x, self.loc.y)
end

function Character:center(x, y)
	self.loc.x = x - self.image:getWidth()/2
	self.loc.y = y - self.image:getHeight()/2
end

function Character:load()
	self.image = love.graphics.newImage(self.name)
end

return Character