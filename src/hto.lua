
display.setStatusBar(display.HiddenStatusBar)
local composer= require ("composer")
tits=0;
local options = {
    effect = "fade",
    time = 100

}

local composer = require( "composer" )

local scene = composer.newScene()
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function goback()
composer.gotoScene("menu")
end

-- create()
function scene:create( event )
    composer.removeScene("menu")

function starts()
yobaby=1;
  local sceneGroup = self.view

    -- "custom data"
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local backg = display.newImage( "startback.png",display.contentWidth,display.contentHeight)
    backg.x = display.contentCenterX
    backg.y = display.contentCenterY
    sceneGroup:insert(backg)
    sqtext = display.newText("Touch the blue bubbles\n on the screen and \n move it around the screen.\n Collect only blue bubbles. \n You get 5 points collecting the \n blue bubble and 1 point for \n leaving other bubbles.\n Do not Touch Bubbles \n of other colors.\n Donot leave you finger \n from the screen.",0,0,native.systemFont,20)
    sqtext.x=display.contentCenterX
    sqtext.y=125
    sqtext:setFillColor(0,0,0)
    sceneGroup:insert(sqtext);

    local how = display.newImageRect( "goback.png",300,100)
    how.x = display.contentCenterX
    how.y = display.contentCenterY+120
    sceneGroup:insert(how)

    how:addEventListener( "tap", goback)
    end
starts();

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
