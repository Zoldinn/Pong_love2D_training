local createPad = require("pad")
local ball = require("ball")

function love.load()
	screen = {}
	screen.width, screen.height = love.window.getMode()

	local padHeight = 120
	local padWidth = 30

	pad = createPad()
	pad.load(10, ((screen.height / 2) - (padHeight /2)), padWidth, padHeight)

	pad2 = createPad()
	pad2.load((screen.width - padWidth - pad.x), ((screen.height / 2) - (padHeight /2)), padWidth, padHeight)

	ball.load()
end

function love.update(dt)
	pad.update(dt, "d", "c")
	pad2.update(dt, "up", "down")
	ball.update(dt)

	-- touches utiles
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.draw()
	pad.draw()
	pad2.draw()
	ball.draw()
end