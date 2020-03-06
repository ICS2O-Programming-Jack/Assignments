-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Global Variables
scrollspeed = 3
scrollRspeed = -3
--BG image width and height
local backgroundImage = display.newImageRect("Images/Background.png", 2048, 1536)
--character image width and height
local Danny = display.newImageRect("Images/Danny.png", 200, 200)

--set the image to be transparent
Danny.alpha = 0

--set the initial x and y position of the beetleship
Danny.x = 0
Danny.y = display.contentHeight/3

--Function MoveShip
local function MoveDanny(event)
	--add the scroll speed to the x value of the ship 
	beetleship.x = beetleship.x + scrollspeed
	--Change the transparency
	beetleship.yScale = .5
	beetleship.xScale = .5
	beetleship.alpha = beetleship.alpha + 0.01
end

--repeat this over and over
Runtime:addEventListener("enterFrame", MoveShip)

local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

--set the image to be transparent
rocketship.alpha = 1

--set the initial x and y position of the rocketship
rocketship.x = 500
rocketship.y = display.contentHeight*(2/3)

--Function MoveShip
local function MoveCorgie(event)
	--add the scroll speed to the x value of the ship 
	rocketship.x = rocketship.x + scrollRspeed
	--Change the transparency
	rocketship:scale(1.004, 1.004)
	rocketship.alpha = rocketship.alpha - 0.00000001

end

--repeat this over and over
Runtime:addEventListener("enterFrame", MoveCorgie)