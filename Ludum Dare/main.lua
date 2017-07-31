local width,height = love.graphics.getDimensions()
local images = require('images')
local const = require('const')
local chr = require('char')
local shop = require('shop')

function sub_menu_close()
	sub_menu = false
	crew_menu = false
	map_menu = false
	power_menu = false
	cargo_menu = false
	time_menu = false
end

function love.load()
	
	event = 1
	
	menu_select = 1
	menu_select2 = 1
	
	item = 1
	
	deltaTime = 0
	deltaTime2 = 0
	deltaTime3 = 0
	
	sub_menu_close()
	
	new_scenario = false
	new_day = false
	pause = false
	
	math.randomseed(os.time())
	
	shop.power = math.random(0, 2)
	shop.food = math.random(5, 15)
	shop.med = math.random(5, 15)
	
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
		
		if menu_select == 1 and sub_menu == false then
			love.graphics.draw(images.action_menu_1, 0, 0)
			--love.graphics.print("Power Room: "..const.room1, 980, 0)
			--love.graphics.print("Food Room: "..const.room2, 980, 50)
			--love.graphics.print("Heal Room: "..const.room3, 980, 100)
			--love.graphics.print("Defence Room: "..const.room4, 980, 150)
		elseif menu_select == 2 and sub_menu == false then
			love.graphics.draw(images.action_menu_2, 0, 0)
			--love.graphics.print("Distance: "..const.distance, 980, 0)
		elseif menu_select == 3 and sub_menu == false then
			love.graphics.draw(images.action_menu_3, 0, 0)
			--love.graphics.print("Power: "..const.power, 980, 0)
		elseif menu_select == 4 and sub_menu == false then
			love.graphics.draw(images.action_menu_4, 0, 0)
			--love.graphics.print("Currency: "..const.currency, 980, 0)
			--love.graphics.print("Food: "..const.food, 980, 50)
			--love.graphics.print("Med: "..const.med, 980, 100)
		elseif menu_select == 5 and sub_menu == false then
			love.graphics.draw(images.action_menu_5, 0, 0)
			--love.graphics.print("Day: "..const.day, 980, 50)
			--love.graphics.print("Time: "..60-const.timer, 980, 0)
		end
		
		if sub_menu == true then
			if crew_menu == true then
				love.graphics.draw(images.action_menu_1, 0, 0)
				if menu_select < 6 then
					love.graphics.draw(images.crew_submenu, 16, 16)
				end
				if menu_select == 1 then
					love.graphics.draw(images.crew_menu_1, 272, 0)
					if chr[1].status == 0 then
						love.graphics.draw(images.status, 16, 16)
					else
						love.graphics.print(chr[1].health.."/10", 150, 15)
						love.graphics.print(chr[1].hunger.."/10", 150, 117)
						if chr[1].loc == 1 then
							love.graphics.print("Power", 150, 220)
						elseif chr[1].loc == 2 then
							love.graphics.print("Food", 150, 220)
						elseif chr[1].loc == 3 then
							love.graphics.print("Medical", 150, 220)
						elseif chr[1].loc == 4 then
							love.graphics.print("Defence", 150, 220)
						end
					end
				elseif menu_select == 2 then
					love.graphics.draw(images.crew_menu_2, 272, 0)
					if chr[2].status == 0 then
						love.graphics.draw(images.status, 16, 16)
					else
						love.graphics.print(chr[2].health.."/10", 150, 15)
						love.graphics.print(chr[2].hunger.."/10", 150, 117)
						if chr[2].loc == 1 then
							love.graphics.print("Power", 150, 220)
						elseif chr[2].loc == 2 then
							love.graphics.print("Food", 150, 220)
						elseif chr[2].loc == 3 then
							love.graphics.print("Medical", 150, 220)
						elseif chr[2].loc == 4 then
							love.graphics.print("Defence", 150, 220)
						end
					end
				elseif menu_select == 3 then
					love.graphics.draw(images.crew_menu_3, 272, 0)
					if chr[3].status == 0 then
						love.graphics.draw(images.status, 16, 16)
					else
						love.graphics.print(chr[3].health.."/10", 150, 15)
						love.graphics.print(chr[3].hunger.."/10", 150, 117)
						if chr[3].loc == 1 then
							love.graphics.print("Power", 150, 220)
						elseif chr[3].loc == 2 then
							love.graphics.print("Food", 150, 220)
						elseif chr[3].loc == 3 then
							love.graphics.print("Medical", 150, 220)
						elseif chr[3].loc == 4 then
							love.graphics.print("Defence", 150, 220)
						end
					end
				elseif menu_select == 4 then
					love.graphics.draw(images.crew_menu_4, 272, 0)
					if chr[4].status == 0 then
						love.graphics.draw(images.status, 16, 16)
					else
						love.graphics.print(chr[4].health.."/10", 150, 15)
						love.graphics.print(chr[4].hunger.."/10", 150, 117)
						if chr[4].loc == 1 then
							love.graphics.print("Power", 150, 220)
						elseif chr[4].loc == 2 then
							love.graphics.print("Food", 150, 220)
						elseif chr[4].loc == 3 then
							love.graphics.print("Medical", 150, 220)
						elseif chr[4].loc == 4 then
							love.graphics.print("Defence", 150, 220)
						end
					end
				elseif menu_select == 5 then
					love.graphics.draw(images.crew_menu_5, 272, 0)
					if chr[5].status == 0 then
						love.graphics.draw(images.status, 16, 16)
					else
						love.graphics.print(chr[5].health.."/10", 150, 15)
						love.graphics.print(chr[5].hunger.."/10", 150, 117)
						if chr[5].loc == 1 then
							love.graphics.print("Power", 150, 220)
						elseif chr[5].loc == 2 then
							love.graphics.print("Food", 150, 220)
						elseif chr[5].loc == 3 then
							love.graphics.print("Medical", 150, 220)
						elseif chr[5].loc == 4 then
							love.graphics.print("Defence", 150, 220)
						end
					end
				elseif menu_select == 6 then
					love.graphics.draw(images.crew_menu_6, 272, 0)
				end
			elseif map_menu == true then
				love.graphics.draw(images.action_menu_2, 0, 0)
			elseif power_menu == true then
				love.graphics.draw(images.action_menu_3, 0, 0)
				
			elseif cargo_menu == true then
				love.graphics.draw(images.action_menu_4, 0, 0)
				
			elseif time_menu == true then
				love.graphics.draw(images.action_menu_5, 0, 0)
				
			end
		end
		
		if new_day == true then
			if scenario == 1 or scenario == 2 or scenario == 3 then
				love.graphics.draw(images.merchant, 16, 16)
				if item == 1 then
					love.graphics.draw(images.shop_scenario_1, 272, 0)
				elseif item == 2 then
					love.graphics.draw(images.shop_scenario_2, 272, 0)
				elseif item == 3 then
					love.graphics.draw(images.shop_scenario_3, 272, 0)
				elseif item == 4 then
					love.graphics.draw(images.shop_scenario_4, 272, 0)
				end
				love.graphics.setFont(love.graphics.newFont(50))
				love.graphics.setColor(0, 0, 0)
				love.graphics.print(shop.power, 300, 260)
				love.graphics.print(shop.med, 300, 385)
				love.graphics.print(shop.food, 300, 500)
				love.graphics.print("You Have: "..const.currency, 900, 150)
				love.graphics.setColor(255, 255, 255)
				love.graphics.setFont(love.graphics.newFont(25))
			elseif scenario == 4 or scenario == 5 or scenario == 6 then
			elseif scenario == 7 then
			elseif scenario == 8 then
			elseif scenario == 9 or scenario == 10 then
			end
		end
		
		if pause == true then
			if menu_select2 == 1 then
				love.graphics.draw(images.pause_menu_1, 272, 0)
			else
				love.graphics.draw(images.pause_menu_2, 272, 0)
			end
		end
		
	elseif event == 4 then
		love.graphics.draw(images.c6, 0, 0)
		love.graphics.print("You ran out of power and got stranded!", 0, 0)
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
	elseif event == 3 then
	
		if love.keyboard.isDown("space") and pause == false and sub_menu == false and deltaTime >= 0.1 then
			pause = true
			menu_select2 = 1
			deltaTime = 0
		end 
		
		if love.keyboard.isDown("w") and crew_menu == true and menu_select < 6 and deltaTime >= 0.1 then
			if chr[menu_select].loc == 1 then
				chr[menu_select].loc = 4
			else
				chr[menu_select].loc = chr[menu_select].loc - 1
			end
			deltaTime = 0
		end
		
		if love.keyboard.isDown("s") and crew_menu == true and menu_select < 6 and deltaTime >= 0.1 then
			if chr[menu_select].loc == 4 then
				chr[menu_select].loc = 1
			else
				chr[menu_select].loc = chr[menu_select].loc + 1
			end
			deltaTime = 0
		end
		
		if love.keyboard.isDown("up") and deltaTime >= 0.1 then
			if pause == false and sub_menu == false and new_day == false then
				if menu_select > 1 then
					menu_select = menu_select - 1
				else	
					menu_select = 5
				end
			elseif pause == true and sub_menu == false and deltaTime >= 0.1 then
				if menu_select2 == 1 then 
					menu_select2 = 0
				else
					menu_select2 = 1
				end
			elseif pause == false and crew_menu == true and deltaTime >= 0.1 then
				if menu_select == 1 then
					menu_select = 6
				else
					menu_select = menu_select - 1
				end
			elseif pause == false and sub_menu == false and deltaTime >= 0.1 then
				if new_day == true then
					if scenario == 1 or scenario == 2 or scenario == 3 then
						if item == 1 then
							item = 4
						else
							item = item - 1
						end
					end
				end
			end
			deltaTime = 0
		end
		
		if love.keyboard.isDown("down") and deltaTime >= 0.1 then
			if pause == false and sub_menu == false and new_day == false then
				if menu_select < 5 then
					menu_select = menu_select + 1
				else	
					menu_select = 1
				end
			elseif pause == true and sub_menu == false then
				if menu_select2 == 1 then 
					menu_select2 = 0
				else
					menu_select2 = 1
				end
			elseif pause == false and crew_menu == true and deltaTime >= 0.1 then
				if menu_select == 6 then
					menu_select = 1
				else
					menu_select = menu_select + 1
				end
			elseif pause == false and sub_menu == false and deltaTime >= 0.1 then
				if new_day == true then
					if scenario == 1 or scenario == 2 or scenario == 3 then
						if item == 4 then
							item = 1
						else
							item = item + 1
						end
					end
				end
			end
			deltaTime = 0
		end
		
		if  love.keyboard.isDown("return") and deltaTime >= 0.1 and pause == false and new_day == false then
			deltaTime = 0
			if menu_select == 1 and sub_menu == false then	--crew
				crew_menu = true
				sub_menu = true
				menu_select = 1
			elseif menu_select == 2 and sub_menu == false then	--map
				map_menu = true
				sub_menu = true
				menu_select = 1
			elseif menu_select == 3 and sub_menu == false then	--power
				power_menu = true
				sub_menu = true
				menu_select = 1
			elseif menu_select == 4 and sub_menu == false then	--cargo
				cargo_menu = true
				sub_menu = true
				menu_select = 1
			elseif menu_select == 5 and sub_menu == false then	--time
				time_menu = true
				sub_menu = true
				menu_select = 1
			end
			
			if sub_menu == true and crew_menu == true then
				if menu_select == 6 then
					menu_select = 1
					sub_menu_close()
				end
			end
			
		elseif love.keyboard.isDown("return") and deltaTime >= 0.1 and pause == true then
			deltaTime = 0
			if menu_select2 == 1 then
				pause = false
			else
				love.event.quit()
			end
		elseif love.keyboard.isDown("return") and deltaTime >= 0.1 and new_day == true then
			if scenario == 1 or scenario == 2 or scenario == 3 then		--shop
				if item == 1 then
					if const.currency >= 200 and shop.power >= 1 then
						shop.power = shop.power - 1
						const.currency = const.currency - 200
						const.power = const.power + 1
					end
				elseif item == 2 then
					if const.currency >= 25 and shop.med >= 1 then
						shop.med = shop.med - 1
						const.currency = const.currency - 25
						const.med = const.med + 1
					end
				elseif item == 3 then
					if const.currency >= 10 and shop.food >= 1 then
						shop.food = shop.food - 1
						const.currency = const.currency - 10
						const.food = const.food + 1
					end
				else
					shop.power = math.random(0, 2)
					shop.food = math.random(5, 15)
					shop.med = math.random(5, 15)
					new_day = false
				end
			elseif scenario == 4 or scenario == 5 or scenario == 6 then	--pirates
				new_day = false
			elseif scenario == 7 then									--Quest
				new_day = false
			elseif scenario == 8 then									--Loot
				new_day = false
			elseif scenario == 9 or scenario == 10 then					--forced trade
				new_day = false
			end
			deltaTime = 0
		end
		
	end
	
end

function heal_room(p, dt)
	if deltaTime >= 1 and const.med > 0 and p.health < 10 then
		p.health = p.health + 1
		const.med = const.med - 1
		deltaTime = 0
	end
end 

function food_room(p, dt)
	if deltaTime >= 1 and const.food > 0 and p.hunger < 10 then
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
		if chr[i].status == 1 then
			room_check(chr[i], chr[i].loc, dt)
		end
		i = i + 1
	end
	deltaTime = 0
end

function love.update(dt)
	
	deltaTime = deltaTime + dt
	deltaTime2 = deltaTime2 + dt
	deltaTime3 = deltaTime3 + dt
	
	controls(dt)
	
	if new_day == true and new_scenario == true then
		scenario = math.random(1, 10)
		new_scenario = false
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
			new_scenario = true
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