-- Importe fichier necessaire
local createPad = require("pad") -- pad contient une fonction qui creer un joueur

function love.load()
	-- recupere taille de l'ecran
	screen = {}
	screen.width, screen.height = love.window.getMode()

	-- taille des raquettes / pad
	local padHeight = 120
	local padWidth = 30

	-- joueur a gauche
	pad = createPad() 
	pad.load(10, ((screen.height / 2) - (padHeight /2)), padWidth, padHeight)

	-- joueur a droite
	pad2 = createPad() 
	pad2.load((screen.width - padWidth - pad.x), ((screen.height / 2) - (padHeight /2)), padWidth, padHeight)
end

function love.update(dt)
	pad.update(dt, "d", "c")
	pad2.update(dt, "up", "down")

	-- touches utiles
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
end

function love.draw()
	pad.draw()
	pad2.draw()
end