local composer = require( "composer" )

local scene = composer.newScene()

local _W = display.contentWidth
local _H = display.contentHeight
local _CX = display.contentCenterX
local _CY = display.contentCenterY

local bt


function scene:create( event )
  local sceneGroup = self.view

  local bg = display.newImage(sceneGroup, 'assets/bg01.jpg', _CX, _CY)
  bt = display.newImage(sceneGroup, 'assets/button.png', _W * 17/20, _H * 9/10 )
  bt:scale(0.5,0.5);

  function bt:touch( event )
    if event.phase == "began" then
        print( "You touched the object!" )
        composer.gotoScene( "scene2" )
        return true
    end
  end

  print('create 1')
end

function scene:show( event )
 
  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
    -- Aqui reposiciona os elementos, atualizando o stage
    bt:addEventListener( "touch", bt )

    print('show:will 1')
  elseif ( phase == "did" ) then
    -- Música, física, transições e temporizadores
    --local backgroundMusic = audio.loadStream("assets/music.mp3")
    --audio.play( backgroundMusic )
    print('show:did 1')
  end
end

function scene:hide( event )
 
  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
    --audio.stop( backgroundMusic )
    print('hide:will 1')

  elseif ( phase == "did" ) then
    print('hide:did 1')
  end
end

function scene:destroy( event )
  local sceneGroup = self.view

  print('destroy 1')
end



scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene