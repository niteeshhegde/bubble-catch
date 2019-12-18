
display.setStatusBar(display.HiddenStatusBar)
local composer= require ("composer")
tits=0;
local options = {
    effect = "fade",
    time = 100

}
yobaby=0;
local composer = require( "composer" )

local scene = composer.newScene()
tits=0;
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local function gobro()


composer.gotoScene("game")



end

local function nishit()
composer.gotoScene("hto")
end

-- create()
function scene:create( event )

function start()
  local sceneGroup = self.view
  if(yobaby==1) then
  composer.removeScene("hto");
  end
if(bro==0) then
    composer.removeScene("menu")
elseif(bro==1) then
        composer.removeScene("restart")
        end
    -- "custom data"
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local backg = display.newImage( "startback.png",display.contentWidth,display.contentHeight)
    backg.x = display.contentCenterX
    backg.y = display.contentCenterY
    sceneGroup:insert(backg)
    local ikon = display.newImageRect( "ikon.png",250,250)
    ikon.x = display.contentCenterX
    ikon.y = display.contentCenterY-160
    sceneGroup:insert(ikon)
    local starting = display.newImageRect( "startgame.png",260,110)
    starting.x = display.contentCenterX
    starting.y = display.contentCenterY+40
    sceneGroup:insert(starting)

    local how = display.newImageRect( "howtoplay.png",250,90)
    how.x = display.contentCenterX
    how.y = display.contentCenterY+170
    sceneGroup:insert(how)

    how:addEventListener( "tap", nishit)
    starting:addEventListener( "tap", gobro)
    end
start();

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
    -- Code here runs prior to the removal of scene's view

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
