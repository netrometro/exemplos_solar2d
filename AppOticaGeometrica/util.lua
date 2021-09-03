local util = {}

-- Posiciona o texto com quebra de linha automática
-- Fonte: https://docs.coronalabs.com/tutorial/system/textBlocks/index.html
function util.insertText(group, tmpString, yStart, width, mainPadding)
  local paragraphs = {}
  local paragraph
  
  repeat
      paragraph, tmpString = string.match( tmpString, "([^\n]*)\n(.*)" )
      if paragraph == nil then break end
      paragraphs[#paragraphs+1] = display.newText({ parent = group, text=paragraph, width=width-(mainPadding*2), fontSize=16 } )
      paragraphs[#paragraphs].anchorX = 0
      paragraphs[#paragraphs].anchorY = 0
      paragraphs[#paragraphs].x = mainPadding
      paragraphs[#paragraphs].y = yStart
      paragraphs[#paragraphs]:setFillColor( 1 )
      yStart = yStart + paragraphs[#paragraphs].height
  until tmpString == nil or string.len( tmpString ) == 0
end


return util