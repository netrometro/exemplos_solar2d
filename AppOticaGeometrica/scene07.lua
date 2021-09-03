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
 
 local function prev() 
    composer.gotoScene('scene00', { effect = "fade" , time = 500 } )
 end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
    local bg = display.newRect(sceneGroup,_CX,_CY,_W,_H)
    bg:setFillColor(1,1,1)

    local upe = display.newImage(sceneGroup,'assets/upe_logo.jpg',_CX,_CY)
    upe.anchorY = 0
    upe.y = 0
    upe:scale(0.5,0.5)

    local title = display.newText( sceneGroup, "Ótica Geométrica", _CX, _H *9/20, native.systemFont, 40 )
    title:setFillColor(0,0,0)
    local subject = display.newText( sceneGroup, "Autor: Ewerton Mendonça", _CX, _H *10/20, native.systemFont, 24 )
    subject:setFillColor(0,0,0)
    local subject = display.newText( sceneGroup, "Para a disciplina de Computação Gráfica e Multimídia", _CX, _H *11/20, native.systemFont, 24 )
    subject:setFillColor(0,0,0)
    local subject = display.newText( sceneGroup, "Orientado por: Ewerton Mendonça", _CX, _H *12/20, native.systemFont, 24 )
    subject:setFillColor(0,0,0)

    btNext = display.newGroup()
    local imgNext = display.newImage( btNext, 'assets/bt.png', _CX, _CY)
    local txtNext = display.newText( btNext, "Início", _CX, _CY + imgNext.height / 2, native.systemFont, 80 )
    
    sceneGroup:insert(btNext)

    btNext:scale(0.15,0.15)
    btNext.x = _CX - 50
    btNext.y = _H * 17/20

    btNext:addEventListener('tap', prev)
    
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