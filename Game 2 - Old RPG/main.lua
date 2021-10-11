-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------



--[[

local livro = {}

livro.pagina1 = {}
livro.pagina1.descricao = {
  'A viagem até a Torre foi cansativa.',
  'Era impossível uma torre tão fina e tão alta.',
  'Com certeza a mágica foi usada em sua construção.',
  'A frente uma porta de tamanho comum mas',
  'bem ornamentada estava a frente.'
}
livro.pagina1.alternativas = {
  'Você usa a porta',
  'Arrodeia a Torre em busca de outra entrada'
}
livro.pagina1.destinos = {
  'pagina2',
  'pagina3'
}

livro.pagina2 = {}
livro.pagina2.descricao = {

}
livro.pagina2.alternativas = {

}
livro.pagina2.destinos = {
  
}


local p1 = display.newGroup()

local fig1 = display.newImageRect(p1, 'assets/pagina1.jpg',320,180)
fig1.x = display.contentCenterX
fig1.y = -20

local linha = 1


for i, v in ipairs(livro.pagina1.descricao) do
  display.newText(p1, v, _W/2, _H*(1+i)/10, native.systemFont, 16)
  linha = linha + 1
end


local tt = {}
tt.pagina2 = function (event)
  print('2')
  display.remove(p1)
end
tt.pagina3 = function (event)
  print('3')
end

for i, v in ipairs(livro.pagina1.alternativas) do
  local bt = display.newGroup()
  local img_bt = display.newRect(bt,  _W/2, _H*(linha+i)/10, 310, 30)
  img_bt:setFillColor(0,0,1)
  local txt_bt = display.newText(bt, livro.pagina1.alternativas[i], _W/2, _H*(linha+i)/10,  native.systemFont, 16) 
  bt:addEventListener('tap', tt[livro.pagina1.destinos[i]]-- )
--  p1:insert(bt)
--end

local engine = require('engine')
local pagina01 = require('pagina01')

engine:criaPagina('assets/pagina1.jpg', pagina01)