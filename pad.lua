local function newPad()
	local pad = {}

	function pad.load(x, y, width, height, speed)
		pad.x = x or 10
		pad.y = y or 10
		pad.width = width or 30
		pad.height = height or 120
		pad.speed = speed or 200
	end

	function pad.update(dt, up, down)
		-- limites de l'ecran
		if pad.y <= 0 then
			pad.y = 0
		elseif pad.y + pad.height >= screen.height then
			pad.y = screen.height - pad.height
		end

		-- mouvements
		if love.keyboard.isDown(up) then
			pad.y = pad.y - pad.speed * dt
		elseif love.keyboard.isDown(down) then
			pad.y = pad.y + pad.speed * dt
		end
	end

	function pad.draw()
		love.graphics.rectangle("fill", pad.x, pad.y, pad.width, pad.height)
	end

	return pad
end

return newPad