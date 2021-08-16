-----------------------------------------------------------------------------------------
-- Exemplo vídeo local e remoto
-- Autor: Ewerton Mendonça
-- 16/08/2021
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

_W = display.contentWidth
_H = display.contentHeight

local bg = display.newImage('assets/bg.jpg', _W/2, _H/2 )
bg.rotation = 180
bg.width = _W
bg.height = _H

----------------------------------------------------------------------------------------------------------------------------------------------------
-- Testado e funcional
-- Tem que colocar a permisão de visualizar arquivos de média do aparelho
-- Este código não acrescenta o vídeo no aplicativo, ele abre o vídeo no aplicativo padrão do smartphone e depois volta para a aplicação.
-- Não funciona no simulador para Windows, apenas no smartphone.

-- Exibição com vídeo local
--[[
local onComplete = function( event )
  print( "video session ended" )
end
media.playVideo( "assets/video.mp4", true, onComplete )
]]--

----------------------------------------------------------------------------------------------------------------------------------------------------
-- Exibição com vídeo remoto
-- Mesmo caso do anterior, não funciona no simulador do Windows.
-- Mas no smarthphone roda. Ele abre um player externo, quando termina o vídeo, volta para a aplicação.
--[[
local onComplete = function( event )
  print( "video session ended" )
end
media.playVideo( "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4", media.RemoteSource, true, onComplete )
]]--

----------------------------------------------------------------------------------------------------------------------------------------------------
-- Funcionou, testado.
-- Usando native.newVideo() dá pra colocar o vídeo na aplicação masssss:
-- Esta API não está disponível no Windows;
-- Objetos de vídeo nativos não fazem parte da tela OpenGL e não obedecem à hierarquia de objetos de exibição, portanto, eles sempre aparecerão na frente de objetos de exibição normais, incluindo imagens, texto e objetos vetoriais.
-- No Android, os objetos de vídeo não giram.

local video = native.newVideo( _W/2, _H/5, 240, 135 )

-- Vídeo com o aplicativo
--video:load( "assets/video.mp4", system.ResourceDirectory)
-- Vídeo da web
video:load( "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4", media.RemoteSource )

-- Pula a exibição do vídeo para 30 segundos depois do início
--video:seek( 30 )

local function videoListener( event )
  print( "Event phase: " .. event.phase )

  if event.errorCode then
      native.showAlert( "Error!", event.errorMessage, { "OK" } )
  end
end

video:addEventListener( "video", videoListener )
 
-- Play video
video:play()
 
-- Stop the video and remove
-- video:pause()
-- video:removeSelf()
-- video = nil

