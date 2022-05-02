s01 = {
	title="1. Darkness Falls",
	panels = {
		{
			-- EXT station
			frame = { width = 760, margin= 9, gap=50 },
			layers = {
				{ image = "s01/A-1-starfield.png", parallax = 1, x=20 },
				{ image = "s01/A-2-mountains.png", parallax = 0.8, x = 50 },
				{ image = "s01/A-3-station.png", parallax = 0.6, x = 50 },
				{ image = "s01/A-4-plant.png", parallax = 0.2, x = 20 },
				{ image = "s01/A-5-tree.png", parallax = 0.3, x = 114 },
			},
		},
		{
			-- light switch
			layers = {
				{ images = { "s01/B-1a-roomDark.png", "s01/B-1b-roomLit.png" } , parallax = 1 },
				{ image = "s01/B-2-wall.png", parallax = 0.9 },
				{ images = { "s01/B-3a-switchOff.png", "s01/B-3b-switchOn.png" }, parallax = 0.8 },
				{ image = "s01/B-4-hand.png", parallax = 0.7 },
			},
		},
		{
			-- man looking up
			layers = {
				{ image = "s01/C-1-room.png", parallax = 1 },
				{ image = "s01/C-2-wall.png", parallax = 0.9 },
				{ image = "s01/C-3-doorway.png", parallax = 0.8 },
				{ image = "s01/C-4-man.png", parallax = 0.7 },
			},
		}, 
		{
			-- bulb burning out
			layers = {
				{ images = {"s01/D-1a-bulbOn.png", "s01/D-1b-bulbOff.png"}, parallax = 1 },
				{ images = {"s01/D-2a-alerts.png", "s01/D-2b-bubbles.png"}, parallax = 0.9 },
			},
		},
		{
			-- man in dark
			layers = {
				{ image = "s01/E-1-room.png", parallax = 1 },
				{ image = "s01/E-2-wall.png", parallax = 0.9 },
				{ image = "s01/E-3-doorway.png", parallax = 0.8 },
				{ image = "s01/E-4-man.png", parallax = 0.7 },
			},
		}
	},
}