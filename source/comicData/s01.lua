s01 = {
	title="1. Darkness Falls",
	panels = {
		{
			-- AA: EXT planet
			font = "fonts/font-Cuberick-Bold",
			layers = {
				{ image = "s01/AA-0-starfield.png", parallax = 1 },
				{ image = "s01/AA-2-planet.png", parallax = 0.8 },
				{ image = "s01/AA-1-planet.png", parallax = 0.5 },
				{ image = "s01/AA-3-marker.png", parallax = 0.5, 
					effect = { type = Panels.Effect.BLINK, durations = {on = 1000, off = 500} } 
				},
				{ text = "VENUSIAN OUTPOST 02", 
					effect = { type = Panels.Effect.TYPE_ON, delay = 500 }, 
					background = Panels.Color.BLACK,
					x = 20, y = 190, 
					parallax = 0.2
				}
			},
		},
		{
			-- A: EXT station
			frame = { width = 760, margin = 9, gap = 50 }, -- extra wide panel
			audio = { file = "s01/bgLoop", loop = true},
			layers = {
				{ image = "s01/A-1-starfield.png", parallax = 1, x=20 },
				{ image = "s01/A-2-mountains.png", parallax = 0.8, x = 50 },
				{ image = "s01/A-3-station.png", parallax = 0.6, x = 50 },
				{ image = "s01/A-4-plant.png", parallax = 0.2, x = 20 },
				{ image = "s01/A-5-tree.png", parallax = 0.3, x = 114 },
			},
		},
		{
			-- B: light switch
			transitionOffset = -0.025, -- trigger transition just before 50%
			-- trigger switch sound in sync with image transition (scroll point 0.475 = 0.5 - 0.025)
			audio = { file = "s01/switch", scrollTrigger = 0.475 }, 
			layers = {
				{ images = { "s01/B-1a-roomDark.png", "s01/B-1b-roomLit.png" } , parallax = 1 },
				{ image = "s01/B-2-wall.png", parallax = 0.8 },
				{ images = { "s01/B-3a-switchOff.png", "s01/B-3b-switchOn.png" }, parallax = 0.8},
				{ image = "s01/B-4-hand.png", parallax = 0.7, 
					-- animate x and y according to scroll position
					y = 50, x = -30, 
					animate={y = -10, x = 10} 
				},
			},
		},
		{
			-- C: man looking up (lights flashing)
			audio = { file = "s01/lightHum", loop = true},
			layers = {
				{ image = "s01/C-1-room.png", parallax = 1 },
				{ image = "s01/C-2-wall.png", parallax = 0.9 },
				{ image = "s01/C-3-doorway.png", parallax = 0.8 },
				{ image = "s01/C-5-darken.png", parallax = 0.8, 
					effect = {
						type = Panels.Effect.BLINK, 
						durations = {on = 50, off = 100}, 
						-- slower flashing if "Reduce Flashing" is enabled
						reduceFlashingDurations = {on = 500, off = 2000}
					}
				},
				{ image = "s01/C-4-man.png", parallax = 0.7 },
			},
		}, 
		{
			-- D: bulb burning out
			transitionOffset = -0.025, -- trigger transition just before 50%
			audio = { file = "s01/bulbPop", scrollTrigger = 0.475 },
			layers = {
				{ images = {"s01/D-1a-bulbOn.png", "s01/D-1b-bulbOff.png"}, parallax = 1 },
				{ images = {"s01/D-2a-alerts.png", "s01/D-2b-bubbles.png"}, parallax = 0.9 },
			},
		},
		{
			-- E: man in dark
			layers = {
				{ image = "s01/E-1-room.png", parallax = 1 },
				{ image = "s01/E-2-wall.png", parallax = 0.9 },
				{ image = "s01/E-3-doorway.png", parallax = 0.8 },
				{ image = "s01/E-4-man.png", parallax = 0.7 },
			},
		}
	},
}