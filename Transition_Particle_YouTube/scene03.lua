local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 _W = display.contentWidth
 _H = display.contentHeight
 
local function gotoScene03() 

  composer.gotoScene("scene03", "fade", 500)

  return true
end
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
  local sceneGroup = self.view
  
  local bg = display.newImage(sceneGroup, 'assets/grass.png', _W / 2, _H / 2)
  bg.width = _W
  bg.height = _H

  local button = display.newRect(sceneGroup, _W / 2, _H / 10, 100, 50);
  button:setFillColor(0,0,1,1)
  button:addEventListener( "tap", gotoScene03 )
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        --[[
      -- Exibindo vídeo
      local video = native.newVideo( display.contentCenterX, display.contentCenterY, 640, 360 )
  
      local function videoListener( event )
          print( "Event phase: " .. event.phase )
        
          if event.errorCode then
              native.showAlert( "Error!", event.errorMessage, { "ERROOOOOO" } )
          end
      end
        
      -- Load a remote video
      video:load( "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4", media.RemoteSource ) 

      -- Add video event listener 
      video:addEventListener( "video", videoListener )
      
      -- Play video
      video:play()
]]--

-- Exibindo Youtube
-- Código de Carlos Costa, Fonte: https://forums.solar2d.com/t/youtube-embedded/347023/12

      local filename="story.html"
      local posY=0
      local story = {} 
      story.title = "Title here" 
      story.youTubeId="aqz-KE-bpKQ" 
      story.description="Description here" 

      local title = story.title or nil 
      local youTubeId = story.youTubeId or nil 
      local path = system.pathForFile( filename, system.TemporaryDirectory ) 
      local fh, errStr = io.open( path, "w" ) 

      if fh then 
        fh:write("\<!doctype html\>\n\<html\>\n\<head\>\n\<meta charset=\"utf-8\"\>") 
        fh:write("\<meta name=\"viewport\" content=\"width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;\"/\>\n") 
        fh:write("\<style type=\"text/css\"\>\n html { -webkit-text-size-adjust: none; font-family: HelveticaNeue-Light, Helvetica, Droid-Sans, Arial, san-serif; font-size: 1.0em; } h1 {color:white; font-size:1.25em;} p {color:white; font-size:0.9em; } \</style\>") 
        fh:write("\</head\>\n\<body style=\"background-color:#000000;\"\>\n") 
        if title then 
          fh:write("\<h1\>" .. title .. "\</h1\>\n")
        end 
        if youTubeId then 
          local videoID = youTubeId 
          local height = math.floor(display.contentWidth / 16 * 9) 
          fh:write([[\<iframe width="100%" height="]] .. height .. [[" src="https://www.youtube.com/embed/]] .. videoID .. [[?controls=1&fs=1&modestbranding=1&rel=0&showinfo=0" frameborder="0" allowfullscreen\>\</iframe\>]]) 
        end 
        if story.description then 
          fh:write("\n\<p\>"..story.description.."\</p\>") 
        end 
        fh:write( "\n\</body\>\n\</html\>\n" ) 
        io.close( fh ) 
      else 
        print( "Create file failed!" ) 
      end 
      local webListener 
      local webView 
      local function create_webView() 
        if webView then 
          webView:removeEventListener( "urlRequest", webListener ) 
          display.remove(webView) 
          webView=nil 
        end 
        webView = native.newWebView(0, 0, display.contentWidth, display.actualContentHeight - posY) 
        webView.x = display.contentCenterX 
        webView.y = posY 
        webView.anchorY = 0 webView:request(filename, system.TemporaryDirectory) 
        webView:addEventListener( "urlRequest", webListener ) 
      end 
      function webListener(event) 
        local url = event.url or nil 
        if not ( string.find(url, filename )) and url then 
          print("url: ".. url) 
          create_webView() 
          system.openURL(url) 
        end 
        return true 
      end 
      create_webView()

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

  button:removeEventListener( "tap", gotoScene03 )

  local sceneGroup = self.view
  sceneGroup:removeSelf()
  sceneGroup = nil
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