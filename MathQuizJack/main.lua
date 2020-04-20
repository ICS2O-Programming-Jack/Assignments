--Math Quiz
--ICS20
--This program displays a question with simple opperations (subtraction, 
--multiplication, ect.) including lives and timers.
-- hides the status bar
display.setStatusBar(display.HiddenStatusBar)
--sets the background colour to a lime green
display.setDefault("background", 0, 1, .5)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local totalSeconds = 11
local secondsLeft = 11
local clockText 
local countDownTimer 
local heart3
local lives = 4
local heart1
local heart2
local questionObject
local points = 0
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local gameOver
local addrandomNumber1
local addrandomNumber2
local multiplyrandomNumber1
local multiplyrandomNumber2
local devisionrandomNumber1
local devisionrandomNumber2
local YouWin
local heart4
local gameOverSound = audio.loadSound("Sounds/GameOver.mp3")
local gameOverSoundChannel

local WinSound = audio.loadSound("Sounds/WinSound.mp3")
local WinSoundChannel
--WinSoundChannel = audio.play(WinSound)

local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel
--correctSoundChannel = audio.play(correctSound)

local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel
--wrongSoundChannel = audio.play(wrongSound)
-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function UpdateTime()

	--decrease the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object 
    clockText.text = secondsLeft .. ""
    
    if (secondsLeft == 0) then
    	--reset the seconds 
    	secondsLeft = totalSeconds
    	lives = lives - 1
    	if (lives == 3) then
    		heart4.isVisible = false
    		wrongSoundChannel = audio.play(wrongSound)
    	elseif (lives == 2) then
    		heart3.isVisible = false
    		wrongSoundChannel = audio.play(wrongSound)
    	elseif (lives == 1) then
    		heart2.isVisible = false
    		wrongSoundChannel = audio.play(wrongSound)
    	elseif (lives == 0) then
    		heart1.isVisible = false
    		gameOver.isVisible = true
    		gameOverSoundChannel = audio.play(gameOverSound)
    		clockText.isVisible = false
    		numericField.isVisible = false
    		if (points = 5) then 
            YouWin.isVisible = true
            WinSoundChannel = audio.play(WinSound)
            end
  end   end
end
 local function AskQuestion()
	-- generate 2 random nembers for division from 1 to 100
	--
	addrandomNumber2 = math.random(1,20)
	addrandomNumber1 = math.random(1,20)
	multiplyrandomNumber1 = math.random(1,10)
	multiplyrandomNumber2 = math.random(1,10)
	devisionrandomNumber1 = math.random(1,100)
	devisionrandomNumber2 = math.random(1,100)
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)
    randomOperator = math.random(1, 4)
	
    if (randomOperator == 1) then
    	--calculate the answer 
     correctAnswer = addrandomNumber1 + addrandomNumber2
	    --create question in text Object
	 questionObject.text = addrandomNumber1 .. " + " .. addrandomNumber2 .. " = "
    elseif (randomOperator == 2) then 
    	if (addrandomNumber1 - addrandomNumber2 < 0) then
    		questionObject.text = addrandomNumber2 .. " - " .. addrandomNumber1 .. " = "
    	else
	    --create question in text Object
	  questionObject.text = addrandomNumber1 .. " - " .. addrandomNumber2 .. " = "
	   end
    elseif (randomOperator == 3) then
     	correctAnswer = multiplyrandomNumber1 * multiplyrandomNumber2
	    --create question in text Object
	 questionObject.text = multiplyrandomNumber1 .. " * " .. multiplyrandomNumber2 .. " = "
    else correctAnswer = devisionrandomNumber1 / devisionrandomNumber2
	    --create question in text Object
	     questionObject.text = devisionrandomNumber1 .. " / " .. devisionrandomNumber2 .. " = "
    correctAnswer = devisionrandomNumber1 / devisionrandomNumber2
    correctAnswer = correctAnswer * 10
    correctAnswer = math.round(correctAnswer)
    correctAnswer = correctAnswer / 10 
    end
end
local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )
	-- user begins editing "numericFeild"
	if ( event.phase == "began" ) then
		--Clear text feild--
		event.target.text = ""

	elseif event.phase == "submitted" then 
		--When the answer is submitted (enter key is touched) set user input to answer
		userAnswer = tonumber(event.target.text)
		--if the user answer and the right answer are the same 
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			timer.performWithDelay(3020, HideCorrect)
			points = points + 1 
			--if points = 5 then 
			--YouWin.isVisible = true
            --WinSoundChannel = audio.play(WinSound)
		    --end
			secondsLeft = totalSeconds
			correctSoundChannel = audio.play(correctSound)
			--update it in the display object 
			pointsText.text = "Numbers correct = " .. points 
		else incorrectObject.isVisible = true 
			secondsLeft = totalSeconds
			correctObject.isVisible = false 
			timer.performWithDelay(3020, HideIncorrect)
		end
	end
end

local function StartTimer()
 -- create a countdown timer that loops infinitely
  countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

 StartTimer()
----------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------------------------------
--display the amount of points as a text object 
pointsText = display.newText("Numbers correct = " .. points, display.contentWidth/2,250, nil, 50)

	--update it in the display object 
	pointsText.text = "Numbers correct = " .. points 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 75 )
questionObject:setTextColor(1 , 1, 1)
questionObject.isVisible = true
--create the correct text object and make it invisible
correctObject = display.newText( "Great!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor (1, 1, 1)
correctObject.isVisible = false
--create the incorrect text and make it invisible
incorrectObject = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject.isVisible = false
--create numeric feild
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener)

--display the lives on the screen
heart1 = display.newImageRect("Images/heart.png" , 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png" , 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png" , 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png" , 100, 100)
heart4.x = display.contentWidth * 1 / 2
heart4.y = display.contentHeight * 1 / 7

YouWin = display.newImageRect("Images/YouWin.png", 1024, 769)
YouWin.x = display.contentWidth/2 
YouWin.y = display.contentHeight/2
YouWin.isVisible = false
--WinSoundChannel = audio.play(WinSound)

gameOver = display.newImageRect("Images/Game Over.jpg", 1024, 769)
gameOver.x = display.contentWidth/2 
gameOver.y = display.contentHeight/2
gameOver.isVisible = false
--update it in the display object 
--clockText.text = "Time: " .. countDownTimer
 clockText = display.newText("Time: " .. secondsLeft, display.contentHeight/8, 25, nil, 50)
----------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
----------------------------------------------------------------------------------------------------------------
--call the function to ask the question
AskQuestion()