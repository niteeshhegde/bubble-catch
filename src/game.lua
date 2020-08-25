local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function gameover(score)
go=1;
local options =
{
    effect = "fromTop",
    time = 3000,
    params =
        {
            var1 = pits,
            sample_var = score,
        }
}
timer.cancel(hey)

--statball:removeEventListener( "touch", statball )
--statball:removeEventListener( "collision",statball)
Runtime:removeEventListener("touch", movePlayer)
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener("enterFrame",background2)
Runtime:removeEventListener("enterFrame",background1)
display.remove(statball);
bro=1;
composer.gotoScene("restart",options)

end
composer.Debug=true
function scene:create( event )

    local sceneGroup = self.view
    -----------------------------------------------------------------------------------------
    --
    -- main.lua
    --
    -----------------------------------------------------------------------------------------

    -- Your code here
    go=0;


    function insideMain()
    pits=0;
  composer.removeScene("menu")
    repeat

    display.setStatusBar(display.HiddenStatusBar)
    score=0
    screen=display.contentHeight

    local backg = display.newImage( "back.png",display.contentWidth,display.contentHeight)
    backg.x = display.contentCenterX
    backg.y = display.contentCenterY
    sceneGroup:insert(backg)
    local background1 = display.newImageRect( "background.png",display.contentWidth,display.contentHeight)
    background1.x = display.contentCenterX
    background1.y = display.contentCenterY
    background1.speed=1
    sceneGroup:insert(background1)
    local background2 = display.newImageRect( "background.png",display.contentWidth,display.contentHeight)
    background2.x = display.contentCenterX
    background2.y = display.contentCenterY+display.contentHeight
    background2.speed=1
    sceneGroup:insert(background2)
    local statball = display.newImageRect( "ball.png", 52, 52 )
    statball.x = display.contentCenterX
    statball.y = display.contentHeight
    statball.type="statb"
    sceneGroup:insert(statball)
    transition.to(balls,{time=3000,y = display.contentHeight+72})

    local physics = require("physics")
    physics.start()
    physics.addBody( statball, "static", { density=1.0, friction=0.3, bounce=0.2, radius=22 })
    function statball:touch( event )

        if (event.phase == "began" and event.target==statball) then
            pits=1;
            self.markX = self.x    -- store x location of object
            self.markY = self.y    -- store y location of object

        elseif event.phase == "moved" then
            if pits==1 then
            local x = (event.x - event.xStart) + self.markX
            local y = (event.y - event.yStart) + self.markY
            self.x, self.y = x, y    -- move object based on calculations above
            else

            if go==0 then
            gameover(0)
            end;
            end
        elseif (event.phase == "ended" or event.phase == "cancelled")then
        if go==0 then
        gameover(0)
        end;
        end

        return true
    end
    stext = display.newText("Score : 0",0,0,"Helvetica",40)
    stext.x=display.contentCenterX
    stext.y=15
    stext:setTextColor(252,0,0)
    sceneGroup:insert(stext)
    -- make 'statball' listen for touch events
statball:addEventListener( "touch", statball )


    local function onLocalCollision(self,event )
    	if ( event.phase == "began" ) then
          if event.other.type=="ball" and event.target.type=="statb" then
    	       event.other:removeSelf()
             event.other.vo=8;
             score=score+5;
             stext.text="Score : "..score
          else
                if go==0 then
                gameover(score)
                end
          end
          end
    end

    statball.collision = onLocalCollision
    statball:addEventListener( "collision",statball)

    function scroll(self,event)
    if self.y < -(display.contentCenterY-9) then
        self.y = display.contentCenterY+display.contentHeight+10
    else
        self.y=self.y-7
        end
    end
    function listener1(circle)
    if circle.type=="ball" then
      if circle.vo==1 then
        if circle.y >=screen+72 then
        display.remove(event.circle)
        if go==0 then
        gameover(score)
        end
            end
        end
      end
    end
    function listener2(circle)
    if circle.type=="noball" then
        if circle.y >=screen+72 then
            score=score+1;
               stext.text="Score : "..score
               display.remove(event.circle)
            end
      end
    end
    local function generateRandomThings()
    if(go==0) then
    -- First call a this function
    local images = { "ball.png","game1.png","game2.png","game3.png","game4.png"};
    local r = math.random(1, #images);
    if(images[r] == "ball.png") then
    circle = display.newImageRect( sceneGroup,images[r],52,52);
        physics.addBody( circle, { density=1.0, friction=0.3, bounce=0.2, radius=25 } )
        circle.type="ball"
        circle.vo=1
        if(score<=1100) then
        transition.to(circle,{time=3000-(score*2),y = screen+72, onComplete=listener1 })
        else
          transition.to(circle,{time=1000,y = screen+72, onComplete=listener1 })
          end
    else
        circle = display.newImageRect(sceneGroup,images[r],52,52);
        circle.type="noball"
        circle.vo=1
        physics.addBody( circle, { density=1.0, friction=0.3, bounce=0.2, radius=25 } )
        if(score<=1100) then
        transition.to(circle,{time=3000-(score*2),y = screen+72, onComplete=listener2 })
        else
          transition.to(circle,{time=1000,y = screen+72, onComplete=listener2 })
        end
      end


    -- The two lines of code above is displaying and add physics to your object.

    -- Below gives the random positions of the object (You can change it)
    circle.x = math.random(27, display.contentWidth-30)
    circle.y = -100

    -- Also gives a random rotation, thought you might like to see this. For more effect
    circle.rotation = math.random(1,360)
    circle.alpha = 0.8
    end

    end

    --[[ The below code calls the function above, you can change
    the time it's 200 at the moment. Then "generateRandomThings"
    calls it. 0 is indicating the function to call itself non-stop,
    you can change it to any amount you like.]]

      apspd=500
      --print(apsnd);
            hey = timer.performWithDelay(500,generateRandomThings,0)


    background1.enterFrame=scroll
    Runtime:addEventListener("enterFrame",background1)
    background2.enterFrame=scroll
    Runtime:addEventListener("enterFrame",background2)
    until(go==0)

    end

    insideMain()

    -- Code here runs when the scene is first created but has not yet appeared on screen

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
