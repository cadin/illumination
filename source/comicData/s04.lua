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

function render4c(panel, offset)
	if beeSound == nil then
		beeSound = playdate.sound.sampleplayer.new("audio/s04/bee")
		beeSound:play(0)
	end
	
	if playdate.buttonIsPressed(Panels.Input.RIGHT) then
		vx = vx + 0.2
		flip = playdate.graphics.kImageUnflipped 
		
	elseif playdate.buttonIsPressed(Panels.Input.LEFT) then
		flip = playdate.graphics.kImageFlippedX 
		vx = vx -= 0.2
	else
		vx = vx * 0.99
	end
	
	if playdate.buttonIsPressed(Panels.Input.DOWN) then
		vy = vy + 0.2
	elseif playdate.buttonIsPressed(Panels.Input.UP) then
		vy = vy -= 0.2
	else
		vy = vy * 0.99
	end
	
	
	beeX = beeX + vx
	beeY = beeY + vy
	
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

	
	-- beeY = playdate.getCrankPosition()
	
	local shakeX = 0-- math.random(-1, 1)
	local shakeY = math.random(-1, 1)
	
	local frame = panel.frame
	local pct = 1 - (frame.x - frame.margin + frame.width + offset.x) / (ScreenWidth + frame.width)
	
	for i, layer in ipairs(panel.layers) do

		local p = layer.parallax or 0
		local xPos = math.floor(layer.x + (panel.parallaxDistance * pct - panel.parallaxDistance/2) * p)
		if layer.name == "bee" then 			
			layer.img:draw(beeX + shakeX, beeY + shakeY, flip)
		else
			
			if layer.name == "flower" then 
				flowerIndex = i - 3
				if flowersCollected[flowerIndex] == false then
					if beeX + 25 > layer.x + 10 and beeX + 25 < layer.x  + 40 and beeY + 25 > layer.y + 10 and beeY + 25 < layer.y + 40 then
						flowersCollected[flowerIndex] = true
						numFlowersCollected = numFlowersCollected + 1
						pickupSound:play()
					end
					
					layer.img:draw(xPos, layer.y)
				end
				
			else
				layer.img:draw(xPos,layer.y)
			end
		end
	end
end

function advance4c()
	return numFlowersCollected >= 3
end

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


s04 = {
	scrollType = Panels.ScrollType.AUTO,
	showAdvanceControl = false,
	advanceControl = nil,
	font = "fonts/font-Cuberick-Bold",
	advanceDelay = 500,
	panels = {
		{
			-- open bee box
			advanceControlSequence = {Panels.Input.A},
			advanceDelay = 1500,

			layers = {
				{ image = "s04/A-1-hand.png", parallax = 0.5 },
				{ image = "s04/A-2-lid.png", parallax = 0.5, 
					animate = { 
						x = -66, y = 160, trigger = Panels.Input.A, 
						duration = 700, ease = playdate.easingFunctions.outQuint,
						audio = { file = "s04/open" },
					},
				},
				{ images = {"shared/blank.png", "s04/A-3-alerts.png"}, parallax = 0.6, advanceControl=Panels.Input.A },
			},
		}, 
		{
			-- computer screen
			showAdvanceControl = true,
			advanceControl = Panels.Input.A,
			advanceControlPosition = {x= 300, y= 160, delay=1200},
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
				
				{ text = "PILOT DRONE TO FLOWERS", rect={width=100, height=200}, lineHeightAdjustment = 6, x = 270, y = 30, effect={ type= Panels.Effect.TYPE_ON, duration= 1000, delay = 1000}, color= Panels.Color.WHITE }
			},
			
		},
		{
			-- pilot bee
			renderFunction = render4c,
			advanceFunction = advance4c,
			resetFunction = reset4c,
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