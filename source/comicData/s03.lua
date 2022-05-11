s03 = {
	title = "2. Sowing the Seeds",
	panels = {
		{
			-- seed packet
			layers = {
				{ image = "s03/A-seeds.png", parallax = 0.5 },
			},
		},
		{
			-- planting seed
			layers = {
				
				{ image = "s03/B-1-background.png", parallax = 0.5 },
				{ image = "s03/B-2-seed.png", parallax = 0.5, y = -100, animate={ y = 10 } },
				{ image = "s03/B-3-foreground.png", parallax = 0.5 },
			},
		}, 
		{
			-- wonder grow
			layers = {
				{ image = "s03/C-1-bottle.png", parallax = 0.5 },
				{ image = "s03/C-2-alerts.png", parallax = 0.6 },
			},
		}, 
		{
			-- spray pot
			transitionOffset = -0.025, -- trigger transition just before 50%
			audio = { file = "s03/spray", scrollTrigger = 0.475 },
			layers = {
				{ image = "s03/D-1-pot.png", parallax = 0.5 },
				{ image = "s03/D-2-bottle.png", parallax = 0.4,  },
				{ images = {"shared/blank.png", "s03/D-3-spray.png"}, parallax = 0.4,},
			},
		},
		{
			-- vine sprouting
			layers = {
				{ image = "s03/E-1-pot.png", parallax = 0.5 },
				{ 
					images = {
						"s03/E-2-vine1.png", 
						"s03/E-2-vine2.png", 
						"s03/E-2-vine3.png", 
						"s03/E-2-vine4.png", 
						"s03/E-2-vine5.png",
						"s03/E-2-vine5.png"
					}, 
					parallax = 0.5 
				},
			},
		},
		{
			-- vine growing
			frame = {width = 900, margin= 8, gap = 50},
			layers = {
				{ x = 100, image = "s03/F-1-walls.png", parallax = 0.5 },
				{ 
					x = 100,
					images = {
						"s03/F-2-vine1.png", 
						"s03/F-2-vine2.png", 
						"s03/F-2-vine3.png", 
						"s03/F-2-vine4.png",
						"s03/F-2-vine4.png",
						"s03/F-2-vine4.png"
					},
					parallax = 0.5 
				 },
				{ 
					x = 100,
					images = {
						"shared/blank.png", 
						"shared/blank.png", 
						"shared/blank.png",
						"shared/blank.png", 
						"s03/F-3-vine5.png", 
						"s03/F-3-vine6.png", 
						"s03/F-3-vine7.png",
						"s03/F-3-vine7.png",
						"s03/F-3-vine7.png"
					}, 
					parallax = 0.5 
				},
				{ x = 80, image = "s03/F-4-man.png", parallax = 0.6 },
			},
		}
		
	}
}