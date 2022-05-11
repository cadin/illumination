s05 = {
	title = "3. Let There Be Light",
	panels = {
		{
			-- branches
			layers = {
				{ image = "s05/AA-1-bg.png", parallax = 1 },
				{ image = "s05/AA-2-branch1.png", parallax = 0.6 },
				{ image = "s05/AA-3-branch2.png", parallax = 0.3 },
			},
		},
		{
			-- bulb reveal
			
			layers = {
				{ images = {"s05/A-1a-bg.png","s05/A-1a-bg.png", "s05/A-1b-bg.png", "s05/A-1b-bg.png", "s05/A-1b-bg.png"}, parallax = 1 },
				{ images = {"s05/A-2a-branch.png", "s05/A-2b-branch.png", "s05/A-2c-branch.png", "s05/A-2c-branch.png", "s05/A-2c-branch.png"}, parallax = 0.8 },

			},
		}, 
		{
			-- man admire
			audio = { file = "s05/chimes", scrollTrigger = 0.1 },
			layers = {
				{ image = "s05/B-1-man.png", parallax = 1 },
				{ image = "s05/B-2-hand.png", parallax = 0.9 },
				{ image = "s05/B-3-branch.png", parallax = 0.8 },
			},
		}, 
		{
			--logo
			frame = {width = 2400, margin=8, gap=50}, 
			layers = {
				{image = "s05/C-0-black.png", parallax = 1, x = 300},
				{ image = "s05/C-1-starfield.png", parallax = 0.7, x = 550 },
				{ image = "s05/C-2-dots.png", parallax = 0.4, x = 300 },
				{ image = "s05/C-3-branch1.png", parallax = 0.25, x = 120 },
				{ image = "s05/C-4-branch2.png", parallax = 0.1, x = 50 },
				{ image = "s05/C-5-logo.png", parallax = 0.5, x = 350 },
				{ image = "s05/C-6-branch3.png", parallax = 0.3, x = 888 },
				{ image = "s05/C-7-panelsCredit.png", parallax = 0.2, x = 1860, y = 50},

				{ text = "by *Cadin Batrack*", x = 1230, y = 120, parallax = 0.5, color = Panels.Color.WHITE},
			},
		}
	}
	
}