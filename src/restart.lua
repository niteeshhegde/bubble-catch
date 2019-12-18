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
local function change()
starti:removeEventListener( "tap", change)
tits=1;
local options = {
    effect = "flipFadeOutIn",
    time = 300

}
composer.gotoScene("menu")



end
-- create()
local Group
function scene:create( event )
    composer.removeScene("game")
    local params = event.params
    -- "custom data"
    score = params.sample_var
hat=params.var1;
    -- Code here runs when the scene is first created but has not yet appeared on screen
    function gameover(score)
        Group = self.view

    go=1;

    local backsg = display.newImage( "back.png",display.contentWidth,display.contentHeight)
    backsg.x = display.contentCenterX
    backsg.y = display.contentCenterY
    Group:insert(backsg)
    stext = display.newText("Score : 0",0,0,"Helvetica",40)
    stext.x=display.contentCenterX
    stext.y=15
    stext:setTextColor(252,0,0)
    Group:insert(stext)
    local go = display.newImageRect( "gameover.png",220,180)
    go.x = display.contentCenterX
    go.y = display.contentCenterY+20
    Group:insert(go)
    stext.text="Score : "..score
  starti = display.newImageRect( "startgame.png",200,110)
    starti.x = display.contentCenterX
    starti.y = display.contentCenterY+170
    Group:insert(starti)
    starti:addEventListener( "tap", change)
    print(hat);
    if (hat==0) then
    sqtext = display.newText("You should not touch\n anywhere else on the\n screen other than\n the ball",0,0,native.systemFont,25)
    sqtext.x=display.contentCenterX
    sqtext.y=125
    sqtext:setFillColor(0,0,0)
    Group:insert(sqtext);
    else
    end

    end
gameover(score)

end

-- show()
function scene:show( event )

    local Group = self.view
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
