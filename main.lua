local width,height = love.graphics.getDimensions()
local images = require('images')
local const = require('const')

function love.load()
	
	event = 1
	menu_select = 1
	deltaTime = 0
	new_day = true
	math.randomseed(os.time())
	
end

function love.draw()

	love.graphics.scale(width/640,height/360)
	love.graphics.setFont(love.graphics.newFont(20))
	if event == 1 then 
		love.graphics.draw(images.logo, 0, 0)
	elseif event == 2 then
		if menu_select == 1 then
			love.graphics.draw(images.main_menu_1, 0, 0)
		elseif menu_select == 2 then
			love.graphics.draw(images.main_menu_2, 0, 0)
		end
	elseif event == 3 then
		love.graphics.draw(images.b1, 0, 0)
		love.graphics.draw(images.ship, 200, 100)
		
		love.graphics.print(const.power, 150, 10)
		love.graphics.print(const.day, 150, 55)
		love.graphics.print(const.health, 150, 90)
		love.graphics.print(const.sanity, 150, 135)
		love.graphics.print(const.crew, 150, 170)
		love.graphics.print("6 Currency: "..const.currency, 0, 300)
		
		if new_day == true then
			scenario = math.random(0, 20)
			new_day = false
		end
		
		love.graphics.print("Scenario: "..scenario, 300, 0)
		
	elseif event == 4 then
		love.graphics.print("You ran out of power and got stranded!", 180, 100)
	end
end

function controls(dt)
	
	if event == 2 then
	
		if (love.keyboard.isDown("up") or  love.keyboard.isDown("down")) and deltaTime >= 0.1 then
			deltaTime = 0
			if menu_select == 1 then
				menu_select = 2
			else
				menu_select = 1
			end
		end
		
		if love.keyboard.isDown("return") or love.keyboard.isDown("space") then
			if menu_select == 1 then
				event = 3
			else
				love.event.quit()
			end
		end
	end
	
	if event == 3 then
		if  love.keyboard.isDown("1") and deltaTime >= 0.1 then --hunger
			deltaTime = 0
		elseif love.keyboard.isDown("2") and deltaTime >= 0.1 then --currency
			deltaTime = 0
			
			new_day = true
			
			const.day = const.day + 1
			const.power = const.power - 1
			
		elseif love.keyboard.isDown("3") and deltaTime >= 0.1 then --health
			deltaTime = 0
		elseif love.keyboard.isDown("4") and deltaTime >= 0.1 then --sanity
			deltaTime = 0
		elseif love.keyboard.isDown("5") and deltaTime >= 0.1 then --crew
			deltaTime = 0
		end
	end
	
end

function love.update(dt)
	
	deltaTime = deltaTime + dt
	
	controls(dt)
	
	if event == 4 and deltaTime >= 2 then
		love.event.quit()
	end
	
	if const.power == 0 or const.health <= 0 then
		event = 4
	end
	
	if event == 1 and deltaTime >= 2 then 
		event = 2
		deltaTime = 0
	end
end