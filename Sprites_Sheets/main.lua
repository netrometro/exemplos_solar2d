-----------------------------------------------------------------------------------------
-- Exemplo de Sprite e Sheet
-- Autor: Ewerton Mendonça
-- 29/07/2021
-----------------------------------------------------------------------------------------

_W = display.contentWidth
_H = display.contentHeight

local bg = display.newImage('assets/grass.png', _W / 2, _H /2)
bg.width = _W
bg.height = _H

local sheet = {
  width = 32,
  height = 32,
  numFrames = 24,
  sheetContentWidth = 192,
  sheetContentHeight = 128
}

local playerSheet = graphics.newImageSheet('assets/log.png', sheet)

-- PRIMEIRA FORMA
--[[
local sequence = {
  name = "normal",
  start = 1,
  count = 16,
  time = 1000,
  loopCount = 0,
  loopDirection = 'forward'
}
local player = display.newSprite( playerSheet, sequence)
player:scale(5,5)
player.x = _W / 2
player.y = _H * 1 / 4
player:play()
--player:pause()
]]--

-- SEGUNDA FORMA
--[[
local seqDown = {
  name = "down",
  frames = { 1, 2, 3, 4 },
  time = 1000,
}
local seqUp = {
  name = "up",
  frames = { 7, 8, 9, 10 },
  time = 1000,
}
local seqLeft = {
  name = "left",
  frames = { 13, 14, 15, 16 },
  time = 1000,
}
local seqRight = {
  name = "right",
  frames = { 19, 20, 21, 22 },
  time = 1000,
}
local playerdown = display.newSprite( playerSheet, seqDown)
playerdown:scale(5,5)
playerdown.x = _W / 2
playerdown.y = _H * 1 / 5
playerdown:play()
local playerup = display.newSprite( playerSheet, seqUp)
playerup:scale(5,5)
playerup.x = _W / 2
playerup.y = _H * 2 / 5
playerup:play()
local playerleft = display.newSprite( playerSheet, seqLeft)
playerleft:scale(5,5)
playerleft.x = _W / 2
playerleft.y = _H * 3 / 5
playerleft:play()
local playerright = display.newSprite( playerSheet, seqRight)
playerright:scale(5,5)
playerright.x = _W / 2
playerright.y = _H * 4 / 5
playerright:play()
]]--

-- TERCEIRA FORMA

local sequences = {
  {
    name = "down",
    frames = { 1,2,3,4 },
    time = 1000,
  },{
    name = "up",
    frames = { 7,8,9,10 },
    time = 1000,
  },{
    name = "right",
    frames = { 13,14,15,16 },
    time = 1000,
  },{
    name = "left",
    frames = { 19,20,21,22 },
    time = 1000,
  },{
    name = "idle",
    frames = { 5,11,17,23 },
    time = 1000,
  }
}

local player = display.newSprite(playerSheet, sequences)
player.x = _W / 2
player.y = _H / 2
player:scale(5,5)

player:setSequence('idle')
player:play()


-- DETECTANDO TOQUE, MUDANDO A ANIMAÇÃO BASEADO NA DIREÇÃO DO TOQUE
function andar(e) 
  if (e.phase == "began") then
    if (player.x - e.x > 0) then
      --print("direita")
      
      player:setSequence('left')
      player:play()
    else
      --print("esquera")
      
      player:setSequence('right')
      player:play()
    end
    if (player.y - e.y > 0) then
      --print("acima")
      
      player:setSequence('up')
      player:play()
    else
      --print("abaixo")
      
      player:setSequence('down')
      player:play()
    end
  elseif (e.phase == "moved") then
    --print(e.x .. '    ' .. e.y)
    --player:setSequence('down')
    --player:play()
  elseif (e.phase == "ended") then
    player:setSequence('idle')
    player:play()
  end
end

bg:addEventListener("touch", andar)
