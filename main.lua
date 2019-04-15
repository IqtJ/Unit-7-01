-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--------------
---background
display.setDefault("background", 1, 1, 1)
 

-- simple touch code for first object (heart)
local heart = display.newImageRect( "assets/heart.png", 150, 100 )
heart.x = display.contentCenterX
heart.y = 100
heart.id = "heart button"
 
local function onHeartTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

heart:addEventListener( "touch", onHeartTouched )

-- Comprehensive touch code for second object(ghost)

local ghost = display.newImageRect( "assets/ghost.png", 150, 120 )
ghost.x = display.contentCenterX
ghost.y = 400
ghost.id = "ghost button" 

function ghost:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

ghost:addEventListener( "touch", ghost )