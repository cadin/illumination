-- the Credits screen is accessed from 
-- the Playdate system menu

gameCredits = {

    -- settings for your credits screen
    alignment = Panels.TextAlignment.CENTER,
	autoScroll = false,
    hideStandardHeader = true,

    -- the actual credits for your comic
    -- add as many as you like, the page will scroll
    -- you can add images here too
    lines = {
        { image = "logo.png"},
		{ text = "a Botanist mini-comic"},
		{ text = "by *Cadin Batrack*" },
    }
}