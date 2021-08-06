-----------------------------------------------------------------------------------------
-- Exemplo de Arrastar e soltar, colisão e som.
-- Autor: Ewerton Mendonça
-- 05/08/2021
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

local physics = require('physics')
physics.setDrawMode('debug')
physics.start()
physics.setGravity( 0, 0 )

local _W = display.contentWidth
local _H = display.contentHeight

local g = display.newGroup()

local r = display.newRect(g, _W / 2, _H * 1 / 5, 50, 50)
r.name = 'quadrado'
local c = display.newCircle(g, _W / 2, _H * 4 / 5, 25)
c.name = 'círculo'

physics.addBody(r)
physics.addBody(c, { radius = 25 })

local pow = audio.loadSound('assets/alarm.wav');

local function dragdrop(e) 

  if (e.phase == 'began') then
    c:setFillColor(1,0,0,1)
    audio.play(pow)
  elseif (e.phase == 'moved') then
    c:setFillColor(0,1,0,1)
    c.x = e.x
    c.y = e.y
  elseif (e.phase == 'ended') then
    c:setFillColor(0,0,1,1)
  end

end

c:addEventListener('touch', dragdrop )

local function create(e)
  print('ok')
end

local chronometer = timer.performWithDelay( 1500, create, 10 )

local function teste(e) 
  local deltaRadians = event.xRotation * event.deltaTime
  local deltaDegrees = deltaRadians * (180/math.pi)

  print(e.xRotation)
  print(e.yRotation)
  print(e.zRotation)
  print(e.deltaTime)
  print(deltaRadians)
  print(deltaDegrees)
end

Runtime:addEventListener( "gyroscope", teste )

local function onLocalCollision( self, event )
  print( event.target.name )        --the first object in the collision
  print( event.other.name )         --the second object in the collision
  print( event.selfElement )   --the element (number) of the first object which was hit in the collision
  print( event.otherElement )  --the element (number) of the second object which was hit in the collision
end
c.collision = onLocalCollision
--c:addEventListener( "collision" )

local function onGlobalCollision( event )
  print( event.object1.name )       --the first object in the collision
  print( event.object2.name )       --the second object in the collision
  print( event.element1 )      --the element (number) of the first object which was hit in the collision
  print( event.element2 )      --the element (number) of the second object which was hit in the collision
end
Runtime:addEventListener( "collision", onGlobalCollision )

local bgMusic = audio.loadStream("assets/overdrive.ogg")
audio.reserveChannels( 1 )
audio.setVolume( 0.5, { channel=1 } )
audio.play( bgMusic, { channel=1, loops=-1 } )
--audio.pause( bgMusic, { channel=1, loops=-1 } )



