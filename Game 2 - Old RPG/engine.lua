local _W = display.contentWidth
local _H = display.contentHeight

local engine = {}

engine.actions = {
  pagina01 = function(event)
    print('página 01')
  end,
  pagina02 = function(event)
    print('página 02')
  end,
  pagina03 = function(event)
    print('página 03')
  end,
}

function engine:criaPagina(pathImagem, pagina)
  local scene = display.newGroup()

  local figura = display.newImageRect(scene, pathImagem, display.contentWidth, 180)
  figura.x = display.contentCenterX
  figura.y = 0

  linha = 1
  for i, v in ipairs(pagina.descricao) do
    display.newText(scene, v, _W/2, _H*(2+i)/10, native.systemFont, 16)
    linha = linha + 1
  end

  linha = linha + 1
  for i, v in ipairs(pagina.alternativas) do
    local img_bt = display.newRect(scene, _W/2, _H*(linha+i)/10, 310, 30)
    img_bt:setFillColor(0,0,1)
    img_bt:addEventListener('tap', self.actions[pagina.destinos[i]])
    local txt_bt = display.newText(scene, pagina.alternativas[i], _W/2, _H*(linha+i)/10,  native.systemFont, 16)
  end
end

function engine.destroiPagina(scene)
  scene:removeSelf()
  scene = nil
end


return engine