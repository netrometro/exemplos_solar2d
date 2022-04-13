local composer = require( "composer" )

local scene = composer.newScene()

local _W = display.contentWidth
local _H = display.contentHeight
local _CX = display.contentCenterX
local _CY = display.contentCenterY

local btfront, btback



function scene:create( event )
  local sceneGroup = self.view

  local bg = display.newImage(sceneGroup, 'assets/bg05.jpg', _CX, _CY)
  
  btback = display.newImage(sceneGroup, 'assets/button.png', _W * 3/20, _H * 9/10 )
  btback:scale(0.5,0.5);

  function btback:touch( event )
    if event.phase == "began" then
        print( "You touched the object!" )
        composer.gotoScene( "scene2" )
        return true
    end
  end

  print('create 3')
end

function scene:show( event )
 
  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
    -- Aqui reposiciona os elementos, atualizando o stage
  btback:addEventListener( "touch", btback )

    print('show:will 3')
  elseif ( phase == "did" ) then
    -- Música, física, transições e temporizadores
    --local backgroundMusic = audio.loadStream("assets/music.mp3")
    --audio.play( backgroundMusic )
    print('show:did 3')
  end
end

function scene:hide( event )
 
  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then
    --audio.stop( backgroundMusic )
    
    btback:removeEventListener( "touch", btback )
    print('hide:will 3')

  elseif ( phase == "did" ) then
    print('hide:did 3')
  end
end

function scene:destroy( event )
  local sceneGroup = self.view

  print('destroy 3')
end



scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene