-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local tapCount = 0

local bg = display.newImageRect('assets/background.png',360,570)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local platform = display.newImageRect( "assets/platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect( "assets/balloon.png", 112, 112 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )

local physics = require( "physics" )
physics.start()
 
physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )


local function pushBalloon()
  balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
  
  tapCount = tapCount + 1
  tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )


local function onCollision( event )
    tapCount = 0
    tapText.text = tapCount
end

Runtime:addEventListener( "collision", onCollision )