-- the Credits screen is accessed from 
-- the Playdate system menu

gameCredits = {

    -- settings for credits screen
    alignment = Panels.TextAlignment.CENTER,
	autoScroll = false,
    
    -- I'm using the logo for my header, so I'll hide the standard ("Credits") header
    hideStandardHeader = true,

    -- the actual credits for the comic
    lines = {
        { image = "logo.png"},
		{ text = "a Botanist mini-comic"},
		{ text = "by *Cadin Batrack*" },
    }
}