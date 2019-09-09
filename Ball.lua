Ball = Class{}


function Ball:init(x,y, width, height)
	self.x = x;
	self.y = y;
	self.width = width;
	self.height = height;

	self.dy = math.random(-50, 50);
	self.dx = math.random(2) == 1 and -100 or 100;
end


function Ball:reset()
	self.x = V_WIDTH / 2 - 2;
	self.y = V_HEIGHT / 2 - 2;
	self.dy = math.random(-50, 50);
	self.dx = math.random(2) == 1 and -100 or 100;
end


function Ball:update(dt)
	self.x = self.x + self.dx * dt;
	self.y = self.y + self.dy * dt;
end


function Ball:collides(paddle)
	if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
		return false;
	end
	if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
		return false;
	end
	--if those two are not working then there is a collision
	return true;
end 


function Ball:render()
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height);
end


return Ball;