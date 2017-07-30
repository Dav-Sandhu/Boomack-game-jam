local width,height = love.graphics.getDimensions()
local images = require('images')
local const = require('const')
local chr = require('char')

function love.load()
	
	event = 1
	menu_select = 1
	menu_select2 = 1
	deltaTime = 0
	deltaTime2 = 0
	deltaTime3 = 0
	new_day = true
	pause = false
	math.randomseed(os.time())
	
end

function love.draw()

	--love.graphics.scale(width/160,height/90)
	love.graphics.setFont(love.graphics.newFont(25))
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
		love.graphics.draw(images.ship, 0, 0)
		
		if menu_select == 1 then
			love.graphics.draw(images.action_menu_1, 0, 0)
			love.graphics.print("Power Room: "..const.room1, 980, 0)
			love.graphics.print("Food Room: "..const.room2, 980, 50)
			love.graphics.print("Heal Room: "..const.room3, 980, 100)
			love.graphics.print("Defence Room: "..const.room4, 980, 150)
		elseif menu_select == 2 then
			love.graphics.draw(images.action_menu_2, 0, 0)
			love.graphics.print("Distance: "..const.distance, 980, 0)
		elseif menu_select == 3 then
			love.graphics.draw(images.action_menu_3, 0, 0)
			love.graphics.print("Power: "..const.power, 980, 0)
		elseif menu_select == 4 then
			love.graphics.draw(images.action_menu_4, 0, 0)
			love.graphics.print("Currency: "..const.currency, 980, 0)
			love.graphics.print("Food: "..const.food, 980, 50)
			love.graphics.print("Med: "..const.med, 980, 100)
		elseif menu_select == 5 then
			love.graphics.draw(images.action_menu_5, 0, 0)
			love.graphics.print("Day: "..const.day, 980, 50)
			love.graphics.print("Time: "..60-const.timer, 980, 0)
		end
		if pause == true then
			if menu_select2 == 1 then
				love.graphics.draw(images.pause_menu_1, 272, 0)
			else
				love.graphics.draw(images.pause_menu_2, 272, 0)
			end
		end
		--love.graphics.draw(images.ship, 0, 0)
		
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
		
		if love.keyboard.isDown("return") then
			if menu_select == 1 then
				event = 3
			else
				love.event.quit()
			end
		end
	end
	
	if event == 3 then
	
		if love.keyboard.isDown("space") and pause == false and deltaTime >= 0.1 then
			pause = true
			menu_select2 = 1
			deltaTime = 0
		end 
		
		if love.keyboard.isDown("up") and deltaTime >= 0.1 then
			if pause == false then
				if menu_select > 1 then
					menu_select = menu_select - 1
				else	
					menu_select = 5
				end
				deltaTime = 0
			else
				if menu_select2 == 1 then 
					menu_select2 = 0
				else
					menu_select2 = 1
				end
				deltaTime = 0
			end
		end
		
		if love.keyboard.isDown("down") and deltaTime >= 0.1 then
			if pause == false then
				if menu_select < 5 then
					menu_select = menu_select + 1
				else	
					menu_select = 1
				end
				deltaTime = 0
			else
				if menu_select2 == 1 then 
					menu_select2 = 0
				else
					menu_select2 = 1
				end
				deltaTime = 0
			end
		end
		
		if  love.keyboard.isDown("return") and deltaTime >= 0.1 and pause == false then
			deltaTime = 0
			if menu_select == 1 then	--crew
				
			elseif menu_select == 2 then	--map
				
			elseif menu_select == 3 then	--power
				
			elseif menu_select == 4 then	--cargo
				
			elseif menu_select == 5 then	--time
				
			end
		elseif love.keyboard.isDown("return") and deltaTime >= 0.1 and pause == true then
			deltaTime = 0
			if menu_select2 == 1 then
				pause = false
			else
				love.event.quit()
			end
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

function defence_room(p, dt)
	--intruders
end

function room_check(p, n, dt)
	if n == 1 then
		const.room1 = const.room1 + 1
	elseif n == 2 then
		food_room(p, dt)
		const.room2 = const.room2 + 1
	elseif n == 3 then
		heal_room(p, dt)
		const.room3 = const.room3 + 1
	elseif n == 4 then
		defence_room(p, dt)
		const.room4 = const.room4 + 1
	end
end

function ship(dt)
	local i = 1
	const.room1 = 0
	const.room2 = 0
	const.room3 = 0
	const.room4 = 0
	while (i <= 5) do
		room_check(chr[i], chr[i].loc, dt)
		i = i + 1
	end
	deltaTime = 0
end

function love.update(dt)
	
	deltaTime = deltaTime + dt
	deltaTime2 = deltaTime2 + dt
	deltaTime3 = deltaTime3 + dt
	
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
	
	const.crew = #chr
	
	if event == 3 then
		if const.timer < 60 and deltaTime2 >= 1 and pause == false then --1 min = time limit
			const.timer = const.timer + 1
			ship(dt)
			deltaTime2 = 0
		elseif const.timer >= 60 then
			const.timer = 0
			new_day = true
			const.day = const.day + 1
			const.power = const.power - 1
		end
		
		if const.distance >= 2000 then
			--win
		end
	end
	
	if deltaTime3 >= 5 and pause == false then
		const.distance = const.distance + (2*const.room1)
		deltaTime3 = 0
	end
	
end