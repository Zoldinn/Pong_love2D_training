local Playing = require("Playing.playing")

function love.load()
	playing.load()
end

function love.update(dt)
	playing.update()
end

function love.draw()
	playing.draw()
end