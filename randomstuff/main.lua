-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: Apr 16, 2019
--
-- This file will work with simple and comprehensive touch events
-----------------------------------------------------------------------------------------

local background = display.setDefault("background", 1, 198/255, 246/255)

local pikachu = display.newImageRect( "assets/pikachu.png", 150, 164)
pikachu.x = 180
pikachu.y = 110
pikachu.id = "pikachu object"
 
local function onPikachuTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

pikachu:addEventListener( "touch", onPikachuTouched )

local pokeball = display.newImageRect( "assets/pokeball.png", 50, 31)
pokeball.x = display.contentCenterX
pokeball.y = 300
pokeball.id = "pokeball object"
 
function pokeball:touch( event )
local pokeballTouched = event.target

    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.markX = self.x
        self.markY = self.y
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
            self.x = event.x - event.xStart + self.markX
            self.y = event.y - event.yStart + self.markY
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

pokeball:addEventListener( "touch", pokeball )