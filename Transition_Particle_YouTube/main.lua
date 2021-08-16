-----------------------------------------------------------------------------------------
-- Exemplo de transição, emissor de particulas e vídeo
-- Autor: Ewerton Mendonça
-- 13/08/2021
-----------------------------------------------------------------------------------------

-- Esconde a status bar
display.setStatusBar( display.HiddenStatusBar )

-- Inclui o módulo "composer" 
local composer = require "composer"

-- Lê a cena de abertura
composer.gotoScene( "scene01", "slideLeft", 1000) 