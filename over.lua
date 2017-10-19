local over = {}

function over:draw() 
	love.graphics.print("Game over...\nPress r to restart", gameX/2, gameY/2)
end

return over