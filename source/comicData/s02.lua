s02 = {	
	-- this sequence has no title, 
	-- so it won't show up as a separate chapter in the chapter menu
	direction = Panels.ScrollDirection.TOP_DOWN,
	panels = {
		{
			-- A: passageway to Seed Bank
			layers = {
				{image = "s02/1-A-hole.png", y = -16, parallax = 0.5 }
			}
		},
		{
			-- B: climbing down the shaft
			frame = { gap = 50, margin = 8, height = 960},
			audio = { file = "s02/drips", loop = true, volume = 0.2 },
			layers = {
				{ image = "s02/2-A-backWall.png", parallax = 0.3 },
				{ image = "s02/2-B-foreground.png", parallax = 0.2 },
				{ image = "s02/2-C-alerts.png", parallax = 0.1 }	
			}
		}
	},
}