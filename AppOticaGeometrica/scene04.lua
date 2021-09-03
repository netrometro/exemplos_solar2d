-----------------------------------------------------------------------------------------
-- Exemplo de App Educacional Multimídia Interativo
-- Disciplina de Computação Gráfica e Multimídia 2020.2 (2021)
-- Autor: Prof. Ewerton Mendonça
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 _W = display.contentWidth
 _H = display.contentHeight
 _CX = display.contentCenterX
 _CY = display.contentCenterY
 
 local function next() 
    composer.gotoScene('scene05', { effect = "fade" , time = 500 } )
 end
 
 local function prev() 
    composer.gotoScene('scene03', { effect = "fade" , time = 500 } )
 end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
    local title = display.newText( sceneGroup, "Ótica Geométrica", _CX, _H *1/20, native.systemFont, 30 )
    local subject = display.newText( sceneGroup, "Tela 04", _CX, _H *2/20, native.systemFont, 24 )

    btNext = display.newGroup()
    local imgNext = display.newImage( btNext, 'assets/bt.png', _CX, _CY)
    local txtNext = display.newText( btNext, "Próximo", _CX, _CY + imgNext.height / 2, native.systemFont, 80 )
    
    sceneGroup:insert(btNext)

    btNext:scale(0.15,0.15)
    btNext.x = _W * 17/20
    btNext.y = _H * 17/20

    btNext:addEventListener('tap', next)

    
    btPrev = display.newGroup()
    local imgPrev = display.newImage( btPrev, 'assets/bt.png', _CX, _CY)
    local txtPrev = display.newText( btPrev, "Anterior", _CX, _CY + imgNext.height / 2, native.systemFont, 80 )
    
    sceneGroup:insert(btPrev)

    btPrev:scale(0.15,0.15)
    btPrev.x = _W * 0/20
    btPrev.y = _H * 17/20

    btPrev:addEventListener('tap', prev)
    
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
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
 
    local sceneGroup = self.view
    
    btNext:removeEventListener('tap', next)
    btPrev:removeEventListener('tap', prev)
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