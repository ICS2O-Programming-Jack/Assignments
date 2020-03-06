-----------------------------------------------------------------------------------------
--Jack Fiander 
-- ICS20
--This program displays four shapes on an ipad.
-----------------------------------------------------------------------------------------

-- Your code here
local myTriangle
local verticesTriangle = {-40, -50, 40, -50, 0, 50}
local triangleText
display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 202/255, 0/255, 188/255)

myTriangle = display.newPolygon(100, 100, verticesTriangle)

myTriangle:setFillColor(60/255, 60/255, 60/255)

-- Your code here
local myHexagon
local verticesHexagon = {0,10,10,5, 10,-5,0,-10,-10,-5,-10,5}

myHexagon = display.newPolygon(100, 100, verticesHexagon)

myHexagon:setFillColor(20/255, 0/255, 0/255)


triangleText = display.newText("This is a Hexagon inside a triangle", 105, 45, Slackey,14)

local myTrapazoid
local verticesTrapazoid = {-20,20,20,20,40,-10,-40,-10}
local trapazoidText
myTrapazoid = display.newPolygon(250, 120, verticesTrapazoid)

myTrapazoid:setFillColor(20/255, 0/255, 0/255)

trapazoidText = display.newText("This is a trapazoid", 300,95, Slackey,14)

local myRombus
local verticesRombus = {0,4,2,0,0,-4,-2,0}
local rombusText
myRombus = display.newPolygon(400, 200, verticesRombus)

myRombus:setFillColor(20/255, 0/255, 0/255)
myRombus.width = 60
myRombus.height = 120
rombusText = display.newText("This is a Rombus", 330,220, Slackey,14)

