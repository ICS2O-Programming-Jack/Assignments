-----------------------------------------------------------------------------------------
--Jack Fiander 
-- ICS20
--This program displays four shapes on an ipad.
-----------------------------------------------------------------------------------------

-- Your code here
local myTriangle
local verticesTriangle = {-40, -50, 40, -50, 0, 50}
local baseOfTriangle
local heightOfTriangle
local areaOfTriangle

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 202/255, 0/255, 188/255)

display.newPolygon(100, 100, verticesTriangle)

myTriangle:setFillColor(120/255, 141/255, 185/255)