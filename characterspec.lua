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
	world:update(self, self.loc.x, self.loc.y)
end

function Character:load()
	self.image = love.graphics.newImage(self.name)
	world:add(self,self.loc.x, self.loc.y, self.image:getWidth(), self.image:getHeight())
end

function Character:update(dt)
	world:update(self, self.loc.x, self.loc.y)
end	

return Character