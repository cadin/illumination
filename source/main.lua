-- IMPORT:
-- Panels is included as a submodule in this repo
-- if you don't see any files in libraries/panels  
-- you may need to initialize the submodule
import "libraries/panels/Panels"

-- CREDITS:
-- the table inside `gameCredits.lua` defines the game credits
import "gameCredits.lua"
Panels.credits = gameCredits

-- COMIC DATA:
import "comicData.lua"

-- SETTINGS:
-- change any settings before calling `start()`
-- Panels.Settings.listUnnamedSequences = true
Panels.Settings.chapterMenuHeaderImage = "logo.png"

-- START:
-- send the comicData table to the `start()` command
Panels.start(comicData)
