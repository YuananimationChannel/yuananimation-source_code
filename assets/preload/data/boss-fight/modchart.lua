local background = nil

function start (song)
    hudX = getHudX()
    hudY = getHudY()

	
	BlackBG = makeSprite('BlackFade','blackbg', true)
	setActorX(200,'blackbg')
    setActorY(500,'blackbg')
    setActorAlpha(0,'blackbg')
    setActorScale(4,'blackbg')
	

	hide = false

end

function update (elapsed)
	local currentBeat = (songPos / 1000)*(bpm/60)
	hudX = getHudX()
    hudY = getHudY()
	
	if zoom then
		setCamZoom(2)
	end
	
	if hide then
		for i=0,7 do
			setActorAlpha(0,i)
		end
	end

	if ghostwindow then
        setWindowPos(defaultWindowX + 64 * math.sin((currentBeat * 0.35) * math.pi), defaultWindowY + 64 * math.cos((currentBeat * 0.35) * math.pi))
    else 
        setWindowPos((getScreenWidth() / 2 - getWindowWidth() / 2),  (getScreenHeight() / 2 - getWindowHeight() / 2))
    end
	
	if swayingsmall then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat)) + 10, i)
		end
	end
	if swayingmedium then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*30)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*30)) + 10, i)
		end
	end
	if swayingrare then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*20)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 25 * math.cos((currentBeat + i*30)) + 20, i)
		end
	end
	if swayinglarge then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*30)) + 10, i)
		end
	end
	if swayingbiggest then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
    end
	if swayingbiggest2 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0)) + 350, i)
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0)) - 275, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
	end
	if swayingmove then
		for i=0,3 do
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
	end
	if spinhud then
	    for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorX(_G['defaultStrum'..i..'Y'],i)
        end
    end
		if swayingpog then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 28 * math.cos((currentBeat + i*0.5) * math.pi) + 10, i)
		end
	end
	if spinpog then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 95 * math.sin((currentBeat + i*40) * math.pi) + 20, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.cos((currentBeat + i*20) * math.pi) + 10, i)
		end
	end
	if poggi then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 85 * math.sin((currentBeat + i*10) * math.pi) + 30, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.cos((currentBeat + i*20) * math.pi) + 10, i)
		end
	end
	if spinnote then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 95 * math.cos((currentBeat + i*5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.sin((currentBeat + i*30) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 95 * math.cos((currentBeat + i*5) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 90 * math.sin((currentBeat + i*30) * math.pi), i)
		end
	end
	if spinCrazy then -- spinning crazy
        camHudAngle = 32 * math.sin(currentBeat * math.pi)
        if getHudX() < 320 then
            setHudPosition(getHudX() + 4, 32 * math.cos(currentBeat * math.pi))
        else
            setHudPosition(-640, 32 * math.cos(currentBeat * math.pi))
        end
    end
	if spin then
        if getHudX() + 640 > 1280 and not hit then
            hit = not hit
            direction = 2 * directionMulti
        elseif hit then
            if getHudX() - 640 > -1280 and hit then
                direction = -2 * directionMulti
            else
                hit = not hit
                direction = 2 * directionMulti
            end
        end
        setHudPosition(getHudX() + direction, 32 * math.cos(currentBeat * math.pi) * heightMulti)
    end
	if normal1 then
        for i=0,3 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end
    end
	if normal2 then
        for i=4,7 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
        end
    end
	if finalduet then
        camHudAngle = 5 * math.cos(currentBeat)
	end
	if spinhud2 then
        camHudAngle = 9 * math.sin(currentBeat)
	end
	if noteswap then
	for i=1,2 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.sin((currentBeat + i*5) * math.pi), i)
		end
		for i=5,6 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
	for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.sin((currentBeat + i*100) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
	end
	if noteswap2 then
	for i=1,2 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
		for i=5,6 do
			setActorY(_G['defaultStrum'..i..'Y'] - 100 * math.cos((currentBeat + i*100) * math.pi), i)
		end
	for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
	end
end


function beatHit (beat)
    if camerabeat then
	    setCamZoom(1)
	end
	if camerahit then
	    setCamZoom(1.5)
	end
	if camerahit2 then
	    setCamZoom(1)
	end
end

function stepHit (step)
    if step == 1 then
    end
    if step == 256 then
	swayingmedium = true
	end
	if step == 640 then
	swayingrare = true
	swayingmedium = false
	end
	if step == 880 then
       tweenFadeIn(BlackBG,1,0.01)
	   for i=0,7 do
		tweenFadeIn(i,0,0.01)
    end
	for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
    end
	swayingrare = false
    end	
	if step == 896 then
       tweenFadeIn(BlackBG,0,0.01)
	for i=0,7 do
		tweenFadeIn(i,1,0.01)
    end
	noteswap = true
    end
	if step == 1344 then
	   noteswap = false
	   for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'],i)
            setActorY(_G['defaultStrum'..i..'Y'],i)
       end
	end
	if step == 1471 then
	camerahit = true
	end
	if step == 1535 then
	camerahit = false
	camerahit2 = true
	end
	if step == 1600 then
	zoom = false
	camerahit2 = false
	noteswap2 = true
	end
	if step == 1855 then
	for i=0,7 do
		tweenFadeIn(i,0,0.02)
    end
	end
	if step == 1796 then

    end
	if step == 1856 then

    end
end