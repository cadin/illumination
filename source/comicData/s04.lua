-- //////////////////////////////////
-- CUSTOM GAMEPLAY CODE FOR PANEL 04C

local ScreenWidth <const> = playdate.display.getWidth()
local ScreenHeight <const> = playdate.display.getHeight()

local beeX = 0 
local beeY = 100
local vx = 0 
local vy = 0

local numFlowersCollected = 0
local flowersCollected = {false, false, false}
local flip = playdate.graphics.kImageUnflipped
local beeSound
local pickupSound = playdate.sound.sampleplayer.new("audio/s04/beep")

-- custom render function gets called every frame while panel 4C is on screen
function render4c(panel, offset)
	
	-- start the buzzing sound if it's not playing
	if beeSound == nil then
		beeSound = playdate.sound.sampleplayer.new("audio/s04/bee")
		beeSound:play(0)
	end
	
	-- horizontal velocity
	if playdate.buttonIsPressed(Panels.Input.RIGHT) then
		vx = vx + 0.2
		flip = playdate.graphics.kImageUnflipped 
	elseif playdate.buttonIsPressed(Panels.Input.LEFT) then
		flip = playdate.graphics.kImageFlippedX 
		vx = vx -= 0.2
	else
		vx = vx * 0.99
	end
	
	-- vertical velocity
	if playdate.buttonIsPressed(Panels.Input.DOWN) then
		vy = vy + 0.2
	elseif playdate.buttonIsPressed(Panels.Input.UP) then
		vy = vy -= 0.2
	else
		vy = vy * 0.99
	end
	
	-- update the bee position based on velocity
	beeX = beeX + vx
	beeY = beeY + vy
	
	-- constrain the bee position to the screen dimensions
	if beeX > ScreenWidth - 40 then
		beeX = ScreenWidth - 40
		vx = -2
	elseif beeX < -40 then
		beeX = -40
		vx = 2
	end
	
	if beeY > ScreenHeight - 40 then
		beeY = ScreenHeight - 40
		vy = -2
	elseif beeY < -40 then
		beeY = -40
		vy = 2
	end
	
	-- add some random shake
	local shakeX = 0 -- math.random(-1, 1)
	local shakeY = math.random(-1, 1)
	
	-- calculate the scroll percentage based on the `offset` passed to this function
	local frame = panel.frame
	local pct = 1 - (frame.x - frame.margin + frame.width + offset.x) / (ScreenWidth + frame.width)
	
	-- draw all the layers in the panel
	for i, layer in ipairs(panel.layers) do
		
		-- calculate layer position based on parallax setting and scroll percentage
		local p = layer.parallax or 0
		local xPos = math.floor(layer.x + (panel.parallaxDistance * pct - panel.parallaxDistance/2) * p)
		
		-- if this is the bee layer, just draw it at the current position
		if layer.name == "bee" then 			
			layer.img:draw(beeX + shakeX, beeY + shakeY, flip)
		else
			-- draw flower layers if they haven't been collected yet
			if layer.name == "flower" then 
				flowerIndex = i - 3
				if flowersCollected[flowerIndex] == false then
					-- if the bee is touching a flower, collect it and play a sound
					if beeX + 25 > layer.x + 10 and beeX + 25 < layer.x  + 40 and beeY + 25 > layer.y + 10 and beeY + 25 < layer.y + 40 then
						flowersCollected[flowerIndex] = true
						numFlowersCollected = numFlowersCollected + 1
						pickupSound:play()
					end
					
					layer.img:draw(xPos, layer.y)
				end
				
			else
				-- all other layers get drawn at the calculated parallax offset
				layer.img:draw(xPos,layer.y)
			end
		end
	end
end

-- this function gets called every frame to determine if we should advance to the next panel
-- in our case, we'll advance when all 3 flowers are collected 
function advance4c()
	return numFlowersCollected >= 3
end

-- this gets called when the panel leaves the screen
-- stop the sound and reset all the variables
function reset4c()
	beeX = 0 
	beeY = 100
	vx = 0 
	vy = 0
	
	numFlowersCollected = 0
	flowersCollected = {false, false, false}
	flip = playdate.graphics.kImageUnflipped
	
	beeSound:stop()
	beeSound = nil
end

-- END OF CUSTOM GAMEPLAY CODE 
-- //////////////////////////////////

-- sequence 04 data
s04 = {
	scrollType = Panels.ScrollType.AUTO,
	showAdvanceControl = false,
	advanceControl = nil,
	font = "fonts/font-Cuberick-Bold",
	advanceDelay = 500,
	panels = {
		{
			-- A: open bee box
			
			-- A button triggers transition to next panel 
			-- (after a 1.5s delay to let the animation complete)
			advanceControlSequence = {Panels.Input.A}, 
			advanceDelay = 1500,

			layers = {
				{ image = "s04/A-1-hand.png", parallax = 0.5 },
				{ image = "s04/A-2-lid.png", parallax = 0.5, 
					animate = { 
						x = -66, y = 160, trigger = Panels.Input.A, -- A button triggers animation
						duration = 700, ease = playdate.easingFunctions.outQuint,
						audio = { file = "s04/open" },
					},
				},
				{ images = {"shared/blank.png", "s04/A-3-alerts.png"}, parallax = 0.6,
					advanceControl=Panels.Input.A -- A button triggers image transition
				},
			},
		}, 
		{
			-- B: computer screen
			showAdvanceControl = true,
			advanceControl = Panels.Input.A,
			advanceControlPosition = {x= 300, y= 160, delay=1200},
			
			-- zero duration animations with staggered delays make screen element build on
			-- each animation triggers an audio beep when
			layers = {
				{ image = "s04/B-1-corners.png", },
				{ image = "s04/B-2-bee.png", opacity = 0,
					animate = {opacity= 1, duration= 0, delay = 400, audio={file="s04/beep.wav"}, scrollTrigger = 0 } 	 
				},
				{ image = "s04/B-3-callout1.png", opacity = 0, 
					animate = {opacity= 1, duration= 0, delay = 500, audio={file="s04/beep.wav"}, scrollTrigger = 0 } 	 
				},
				{ image = "s04/B-4-callout2.png", opacity = 0, 
					animate = {opacity= 1, duration= 0, delay = 600, audio={file="s04/beep.wav"}, scrollTrigger = 0 } 	 
				},
				{ image = "s04/B-5-callout3.png", opacity = 0, 
					animate = {opacity= 1, duration= 0, delay = 700, audio={file="s04/beep.wav"}, scrollTrigger = 0 } 	 
				},
				{ image = "s04/B-7-callout4.png", opacity = 0, 
					animate = {opacity= 1, duration= 0, delay = 800, audio={file="s04/beep.wav"}, scrollTrigger = 0 } 	 
				},
				
				{ text = "PILOT DRONE TO FLOWERS", 
					rect={ width=100, height=200 }, 
					lineHeightAdjustment = 6, 
					x = 270, y = 30, 
					color= Panels.Color.WHITE
					effect={ 
						type= Panels.Effect.TYPE_ON, 
						duration= 1000, delay = 1000
					}, 
				}
			},
			
		},
		{
			-- C: pilot bee
			-- define the custom functions to use for this panel (above)
			renderFunction = render4c,
			advanceFunction = advance4c,
			resetFunction = reset4c,
			-- D pad controls the game, so don't go to the previous panel when the user presses left
			preventBacktracking = true, 
			layers = {
				{ image = "s04/C-1-black.png", parallax = 1 },
				{ image = "s04/C-2-bottomBranch.png", parallax = 0.5 },
				{ image = "s04/C-3-topBud.png", parallax = 0.7 },
				{ image = "s04/C-6-flower1.png", parallax = 0.7, x = 164, y = 32, name = "flower" },
				{ image = "s04/C-7-flower2.png", parallax = 0.5, x = 88, y = 118, name = "flower" },
				{ image = "s04/C-8-flower3.png", parallax = 0.5, x = 295, y = 154, name = "flower"},
				{ image = "s04/C-5-bee.png", parallax = 0.6, name = "bee", },
				{ image = "s04/C-4-topBranch.png", parallax = 0.7 },
				
				
			},
		}
	}
}