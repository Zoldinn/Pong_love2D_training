local ball = {}

function ball.load(x, y, radius, speed)
	ball.x = x or (screen.width / 2)
	ball.y = y or (screen.height / 2)
	ball.radius = radius or 15
	ball.vx = speed or 300
	ball.vy = speed or 300
end

local function collisions(x, y, width, height)
	if ball.x - ball.radius >= x and ball.x + ball.radius <= x + width then
		if ball.y + ball.radius >= y and ball.y - ball.radius <= y + height then
			ball.vx = ball.vx * -1
		end
	end
	if ball.y + ball.radius >= y and ball.y - ball.radius <= y + height then
		if ball.x + ball.radius >= x and ball.x - ball.radius <= x + width then
			ball.vy = ball.vy * -1
		end
	end
end


function ball.update(dt)
	-- mouvements
	ball.x = ball.x + ball.vx * dt
	ball.y = ball.y + ball.vy * dt
	
	-- Collisions avec l'écran
	if ball.x - ball.radius <= 0 or ball.x + ball.radius >= screen.width then
		ball.vx = ball.vx * -1
	end
	if ball.y - ball.radius <= 0 or ball.y + ball.radius >= screen.height then
		ball.vy = ball.vy * -1
	end
	
	-- collisions pad
	collisions(pad.x, pad.y, pad.width, pad.height)
	-- collisions pad2
	collisions(pad2.x, pad2.y, pad2.width, pad2.height)
end

function ball.draw()
	love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end

return ball