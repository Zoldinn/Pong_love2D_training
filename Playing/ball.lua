local ball = {}

function ball.load(x, y, radius, speed)
	ball.x = x or (screen.width / 2)
	ball.y = y or (screen.height / 2)
	ball.radius = radius or 10
	ball.vx = speed or 300
	ball.vy = speed or 300
end

function ball.update(dt)
	ball.x = ball.x + ball.vx * dt
	ball.y = ball.y + ball.vy * dt
	-- Collisions avec les bords de l'écran
	if ball.y - ball.radius <= 0 then
		ball.vy = ball.vy * -1
		ball.y = 0 + ball.radius
	elseif ball.y + ball.radius >= screen.height then
		ball.vy = ball.vy * -1
		ball.y = screen.height - ball.radius
	end

	if ball.x - ball.radius <= 0 then
		ball.x = screen.width / 2
		ball.y = screen.height / 2
		ball.vx = ball.vx * -1
		score.p2 = score.p2 + 1
	elseif ball.x + ball.radius >= screen.width then
		ball.x = screen.width / 2
		ball.y = screen.height / 2
		ball.vx = ball.vx * -1
		score.p1 = score.p1 + 1
	end

	-- Collisions avec les pad
		-- pad de gauche
	if ball.x - ball.radius <= pad.x + pad.width
		and ball.y + ball.radius >= pad.y
		and ball.y - ball.radius <= pad.y + pad.height then
		ball.vx = ball.vx * -1
		ball.x = pad.x + pad.width + ball.radius
	end

		-- pad de droite
	if ball.x + ball.radius >= pad2.x
		and ball.y + ball.radius >= pad2.y
		and ball.y - ball.radius <= pad2.y + pad2.height then
		ball.vx = ball.vx * -1
		ball.x = pad2.x - ball.radius
	end
end

function ball.draw()
	love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end

return ball
