Character = {}

function Character:new()
	local newObj = {
		name = nil,
		image = nil, 
		loc = {x = 0, y = 0}, 
		acc = {x = 0, y = 0}, 
		vel = {x = 0, y =0}
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
end

function Character:load()
	self.image = love.graphics.newImage(self.name)
end

function Character:force({x, y})
end
function Character:update(dt)

end
return Character