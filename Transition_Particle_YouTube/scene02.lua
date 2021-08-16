local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local physics = require( "physics" )
physics.start()

local testParticleSystem

 _W = display.contentWidth
 _H = display.contentHeight
 
local function gotoScene03() 
  composer.gotoScene("scene03", "zoomInOutRotate", 500)
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

  local button = display.newRect(sceneGroup, _W / 2, _H / 10, 100, 50);
  button:setFillColor(0,0,1,1)
  button:addEventListener( "tap", gotoScene03 )

  testParticleSystem = physics.newParticleSystem(
    {
        filename = "assets/crate.png",
        radius = 10,
        imageRadius = 10
    })

    local direita = display.newRect(sceneGroup, 0, _H / 2, 5, _H)
    local esquerda = display.newRect(sceneGroup, _W, _H / 2, 5, _H)
    local piso = display.newRect(sceneGroup, _W / 2, _H, _W, 5)

    physics.addBody(direita, "static", { friction = 0.1 })
    physics.addBody(esquerda, "static", { friction = 0.1 })
    physics.addBody(piso, "static", { friction = 0.1 })

    local circulo = display.newCircle(sceneGroup, _W * 1/4, _H - 200, 50)
    local quadrado = display.newRect(sceneGroup, _W * 3/4, _H - 200, 100, 100)

    physics.addBody(circulo, "dynamic", { radius = 50 })
    physics.addBody(quadrado, "dynamic")

    function arrastar(e)
      local body = e.target
      local phase = e.phase
      local stage = display.getCurrentStage()

      if (phase == "began") then
        stage:setFocus(body, e.id)
        body.tempJoint = physics.newJoint("touch", body, e.x, e.y)

      elseif (phase == "moved") then
        body.tempJoint:setTarget(e.x, e.y)

      elseif (phase == "ended") then
        stage:setFocus(body, nil)
        body.tempJoint:removeSelf()
      end

      return true
end

circulo:addEventListener("touch", arrastar)
quadrado:addEventListener("touch", arrastar)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then

    
      local function onTimer( event )
        testParticleSystem:createParticle(
        {
            x = 0,
            y = 0,
            velocityX = 256,
            velocityY = 480,
            color = { 1, 0.2, 0.4, 1 },
            lifetime = 32.0,
            flags = { "water", "colorMixing" }
        })
      end
    
      --timer.performWithDelay( 20, onTimer, 500 )
      timer.performWithDelay( 20, onTimer, 0 )


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

  button:removeEventListener( "tap", gotoScene03 )

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