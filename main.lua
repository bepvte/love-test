controls = require "controls"

bump = require "bump"

gamestate = require "hump/gamestate"

DEBUG = os.getenv("DEBUG")

gameX, gameY = love.graphics.getDimensions()

world = bump.newWorld()

-- order is drawing order i think
objects = {
	require("player"),
	require("enemy")(10),
	require("enemy")(100)
}

game = {}


function game:init()
	for _, k in pairs(objects) do
		k:load()
	end
end

function game:enter()
	objects[1]:center(gameX/2, gameY/2)
	love.graphics.setBackgroundColor(0,0,100)
end	

function game:draw()
	if DEBUG then 
		love.graphics.setColor(255, 0, 0)
		love.graphics.line(0,gameY/2, gameX,gameY/2)
		love.graphics.line(gameX/2, 0, gameX/2, gameY)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.print("wow i can make love 2d games.. amazign", 40, 30)
	for _, k in pairs(objects) do
		k:draw()
	end
end


function love.update(dt)
	for k in pairs(controls) do 
		if love.keyboard.isDown(k) then
			controls[k](player, dt)
		end
	end
	for _, k in pairs(objects) do
		k:update(dt)
	end
end

function love.load()
	gamestate.registerEvents()
	gamestate.switch(game)
end