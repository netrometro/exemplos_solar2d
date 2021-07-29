-----------------------------------------------------------------------------------------
-- Exemplo de Physics Touch
-- Autor: Ewerton Mendonça
-- 20/07/2021
-----------------------------------------------------------------------------------------

_W = display.contentWidth -- Largura máxima da tela
_H = display.contentHeight -- Altura máxima da tela

local physics = require("physics")
physics.setDrawMode("debug")
--physics.setDrawMode("hybrid")
physics.start()

local grupo = display.newGroup();

local direita = display.newRect(grupo, 0, _H / 2, 5, _H)
local esquerda = display.newRect(grupo, _W, _H / 2, 5, _H)
local piso = display.newRect(grupo, _W / 2, _H, _W, 5)

physics.addBody(direita, "static", { friction = 0.1 })
physics.addBody(esquerda, "static", { friction = 0.1 })
physics.addBody(piso, "static", { friction = 0.1 })

local circulo = display.newCircle(grupo, _W * 1/4, _H - 200, 50)
local quadrado = display.newRect(grupo, _W * 3/4, _H - 200, 100, 100)

physics.addBody(circulo, "dynamic", { radius = 50 })
physics.addBody(quadrado, "dynamic")

--circulo.isFixedRotation = true  -- Para o objeto não rotacionar
--quadrado.isFixedRotation = true -- Para o objeto não rotacionar

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

--  print(body)
--  print(phase)
--  print(stage)

  return true
end

circulo:addEventListener("touch", arrastar)
quadrado:addEventListener("touch", arrastar)

