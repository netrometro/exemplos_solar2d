-----------------------------------------------------------------------------------------
-- Exemplo de App Educacional Multimídia Interativo
-- Disciplina de Computação Gráfica e Multimídia 2020.2 (2021)
-- Autor: Prof. Ewerton Mendonça
-----------------------------------------------------------------------------------------

-- Biblioteca de funções uteis (Exemplo: quebra de linha em parágrafo)
local util = require('util')
local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- Variáveis auxiliares
_W = display.contentWidth
 _H = display.contentHeight
 _CX = display.contentCenterX
 _CY = display.contentCenterY
 
-- Funções de navegação entre as cenas
local function next() 
composer.gotoScene('scene02', { effect = "fade" , time = 500 } )
end

local function prev() 
composer.gotoScene('scene00', { effect = "fade" , time = 500 } )
end





-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
    local title = display.newText( sceneGroup, "Ótica Geométrica", _CX, _H *1/20, native.systemFont, 30 )
    local subject = display.newText( sceneGroup, "Introdução", _CX, _H *2/20, native.systemFont, 24 )

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
    
    -- Conteúdo
    local texto = [[
    Óptica é a parte da Física responsável pelo estudo dos fenômenos associados à luz. Os fenômenos relacionados à Óptica são conhecidos desde a Antiguidade. Existem registros de que, em 2.283 a.C., já eram utilizados cristais de rocha para observar as estrelas. Na Idade Antiga, na Assíria, já havia a lente de cristal; e, na Grécia, utilizava-se a lente de vidro para obter fogo.

    O grande salto no estudo da Óptica ocorreu no século XVI. Galileu Galilei apresentou o primeiro telescópio, em 1609, e Snell Descartes chegou à Lei da refração. O trabalho mais importante dessa época foi a medição da velocidade da luz. O valor encontrado foi c = 3,08. 1010 cm/s, obtido por Bradley, em 1728.

    Outro importante nome para a evolução dos estudos sobre a Óptica foi o de Huygens, que, em 1678, apresentou a hipótese de que a luz seria uma onda. Isaac Newton também deixou suas contribuições na área, como a teoria da variação do índice de refração da luz pela variação da cor, que pode ser observada na dispersão da luz ao passar por um prisma.

    O fato de se considerar apenas a natureza corpuscular da luz representou um atraso nos estudos da Óptica. Somente em 1801 que Young realizou a experiência da interferência da luz, explicando-a a partir da teoria ondulatória. Em seguida, por volta de 1815, Fresnell explicou a teoria da difração da luz também por meio da teoria ondulatória.

    Outro cientista importante para o desenvolvimento dessa teoria foi Foucault, que descobriu que a velocidade da luz era maior no ar do que na água. Essa descoberta chocava-se com a teoria corpuscular, que afirmava que a velocidade da luz era maior na água que no ar. Foi de James Clerk Maxwell a principal evidência de que a luz comportava-se como uma onda eletromagnética, pois ele provou que a velocidade de propagação de uma onda eletromagnética no espaço era igual à velocidade de propagação da luz.

    A teoria de que a luz comportava-se apenas como uma onda eletromagnética foi questionada no final do século XIX. Isso porque não era suficiente para explicar o efeito fotoelétrico. Einstein utilizou a teoria de Planck para mostrar que a luz era formada por “pequenos pacotes de energia”, os fótons. A partir dessa teoria, Arthur Compton demonstrou que, quando um fóton e um elétron colidem, ambos se comportam como matéria. A partir de então, a luz passou a ser considerada como onda e como partícula, dependendo do fenômeno estudado. Essa teoria é denominada de natureza dual da luz.]]

    local info = [[Arraste a câmera fotográfica no nome escrito no texto para tirar ver uma pintura ou a foto da pessoa.]]

    util.insertText(sceneGroup, texto, 150, 550, 20)
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