local width,height = love.graphics.getDimensions()
local images = require('images')
local const = require('const')
local chr = require('char')

function love.load()
	
	event = 1
	menu_select = 1
	deltaTime = 0
	new_day = true
	math.randomseed(os.time())
	
end

function love.draw()

	love.graphics.scale(width/160,height/90)
	love.graphics.setFont(love.graphics.newFont(5))
	if event == 1 then 
		love.graphics.draw(images.logo, 0, 0)
	elseif event == 2 then
		if menu_select == 1 then
			love.graphics.draw(images.main_menu_1, 0, 0)
		elseif menu_select == 2 then
			love.graphics.draw(images.main_menu_2, 0, 0)
		end
	elseif event == 3 then
		if menu_select == 1 then
			love.graphics.draw(images.action_menu_1, 0, 0)
		elseif menu_select == 2 then
			love.graphics.draw(images.action_menu_2, 0, 0)
		elseif menu_select == 3 then
			love.graphics.draw(images.action_menu_3, 0, 0)
		elseif menu_select == 4 then
			love.graphics.draw(images.action_menu_4, 0, 0)
		elseif menu_select == 5 then
			love.graphics.draw(images.action_menu_5, 0, 0)
		end
		love.graphics.draw(images.ship, 0, 0)
		
	elseif event == 4 then
		--love.graphics.print("You ran out of power and got stranded!", 0, 0)
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
		
		if love.keyboard.isDown("up") and deltaTime >= 0.1 then
			if menu_select > 1 then
				menu_select = menu_select - 1
			else	
				menu_select = 5
			end
			deltaTime = 0
		end
		
		if love.keyboard.isDown("down") and deltaTime >= 0.1 then
			if menu_select < 5 then
				menu_select = menu_select + 1
			else	
				menu_select = 1
			end
			deltaTime = 0
		end
		
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

function heal_room(p, dt)
	if deltaTime >= 1 and const.med > 0 then
		p.health = p.health + 1
		const.med = const.med - 1
		deltaTime = 0
	end
end 

function food_room(p, dt)
	if deltaTime >= 1 and const.food > 0 then
		p.hunger  = p.hunger + 1
		const.food = const.food - 1
		deltaTime = 0
	end
end

function power_room(p, dt)
	if deltaTime >= 5 then
		const.distance = const.distance + p.ship
	end
end

function love.update(dt)
	
	deltaTime = deltaTime + dt
	
	controls(dt)
	
	if new_day == true then
		scenario = math.random(0, 20)
		new_day = false
	end
	
	if event == 4 and deltaTime >= 2 then	--you lose
		love.event.quit()
	end
	
	if const.power == 0 then event = 4 end
	
	if event == 1 and deltaTime >= 2 then 	--used to wait 2 seconds before switching over to the next event
		event = 2
		deltaTime = 0
	end
	
	const.currency = #chr
	
	if event == 3 then
		if const.timer < 60 and deltaTime >= 1 then --1 min = time limit
			const.timer = const.timer + 1
			deltaTime = 0
		elseif const.timer >= 60 then
			const.timer = 0
			new_day = true
			const.day = const.day + 1
			const.power = const.power - 1
		end
		
		if const.distance >= 1680 then
			--win
		end
	end
	
end