-----------------------------------------------------------------------------------------
--Jack Fiander
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here--hide status bar
display.setStatusBar(display.HiddenStatusBar)
--sound variables 
local correctSoundChannel
local BoingSound = audio.loadSound( "Sounds/BoingSound.mp3")
--Global Variables
scrollspeed = 3
scrollRspeed = -3
--BG image width and height
local backgroundImage = display.newImageRect("Images/Background.jpg", 1000, 1000)
--character image width and height
local Danny = display.newImageRect("Images/Danny.png", 200, 200)
local Pewds = display.newImageRect("Images/Pewdiepie.png", 150, 150)
--set the image to be transparent
Danny.alpha = 0

--set the initial x and y position of Danny Davito 
Danny.x = 0
Danny.y = display.contentHeight/3

--Function MoveDanny
local function MoveDanny(event)
	--add the scroll speed to the x value of the ship 
	Danny.x = Danny.x + scrollspeed
	--Change the transparency
	Danny.yScale = .5
	Danny.xScale = .5
	Danny.alpha = Danny.alpha + 0.01
end

--repeat this over and over
Runtime:addEventListener("enterFrame", MoveDanny)

local Corgie = display.newImageRect("Images/Corgie.png", 200, 200)

--set the image to be transparent
Corgie.alpha = 1

--set the initial x and y position of the Corgie
Corgie.x = 500
Corgie.y = display.contentHeight*(2/3)

--Function MoveCorgie
local function MoveCorgie(event)
	--add the scroll speed to the x value of the Corgie
	Corgie.x = Corgie.x + scrollRspeed
	--Change the transparency
	Corgie:scale(1.004, 1.004)
	Corgie.alpha = Corgie.alpha - 0.00000001

end

--repeat this over and over
Runtime:addEventListener("enterFrame", MoveCorgie)

Pewds.x = 0
Pewds.y = 0
-- move Pewdiepie
local function MovePewds(event)
	--add the scroll speed to the x value of Pewdiepie
	Pewds.x = Pewds.x + scrollspeed 
	Pewds.y = Pewds.y + scrollspeed
	Pewds:rotate(10)
	timer.performWithDelay(10000)
end

--repeat this over and over
Runtime:addEventListener("enterFrame", MovePewds)
correctSoundChannel = audio.play(BoingSound)