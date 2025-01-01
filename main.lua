local createPad = require("pad")
local ball = require("ball")

function love.load()
	screen = {}
	screen.width, screen.height = love.window.getMode()

	local padHeight = 120
	local padWidth = 20

	pad = createPad()
	pad.load(10, ((screen.height / 2) - (padHeight /2)), padWidth, padHeight)

	pad2 = createPad()
	pad2.load((screen.width - padWidth - pad.x), ((screen.height / 2) - (padHeight /2)), padWidth, padHeight)

	ball.load()

	score = {}
	score.p1 = 0
	score.p2 = 0
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
	love.graphics.print("P1 : " ..score.p1, screen.width * 0.1, 10)
	love.graphics.print("P2 : " ..score.p2, screen.width * 0.9, 10)
end