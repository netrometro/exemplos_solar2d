local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 _W = display.contentWidth
 _H = display.contentHeight
 
local function gotoScene02() 

  composer.gotoScene("scene02", "zoomOutIn", 1000)

  return true
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
  local sceneGroup = self.view

  local bg = display.newImage(sceneGroup, 'assets/background.jpg', _W / 2, _H / 2)
  bg.width = _W
  bg.height = _H

  local button = display.newRect(sceneGroup, _W / 2, _H / 10, 100, 50)
  button:setFillColor(1,0,0,1)
  button:addEventListener( "tap", gotoScene02 )

  local floor = display.newImage(sceneGroup, "assets/diamond-plate.jpg", _W/2, _H / 2)
  floor.width = 400
  floor.height = 400

  floor.path.x1 = 90
  floor.path.y1 = 170
  
  floor.path.x4 = -90
  floor.path.y4 = 170

end
 
 
-- show()
function scene:show( event )
 
  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
      -- Code here runs when the scene is still off screen (but is about to come on screen)

  elseif ( phase == "did" ) then

  end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )

  button:removeEventListener( "tap", gotoScene02 )

  local sceneGroup = self.view
  sceneGroup:removeSelf()
  sceneGroup = nil
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene