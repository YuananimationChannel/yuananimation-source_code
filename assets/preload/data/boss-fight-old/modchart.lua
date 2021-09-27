local background = nil

function start (song)--TaeYai doing this crap
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

	if moveslow then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*30)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 10 * math.cos((currentBeat + i*30)) + 10, i)
		end
	end
	if movearrow then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*20)), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 25 * math.cos((currentBeat + i*30)) + 20, i)
		end
	end
	if noteswap then
	for i=1,2 do
			setActorY(_G['defaultStrum'..i..'Y'] - 60 * math.sin((currentBeat + i*40) * math.pi), i)
		end
		for i=5,6 do
			setActorY(_G['defaultStrum'..i..'Y'] - 60 * math.cos((currentBeat + i*40) * math.pi), i)
		end
	for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.sin((currentBeat + i*30) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*30) * math.pi), i)
		end
	end
	if noteswap2 then
	for i=1,2 do
			setActorY(_G['defaultStrum'..i..'Y'] - 40 * math.cos((currentBeat + i*20) * math.pi), i)
		end
		for i=5,6 do
			setActorY(_G['defaultStrum'..i..'Y'] - 40 * math.cos((currentBeat + i*20) * math.pi), i)
		end
	for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
		for i=4,7 do
			setActorX(_G['defaultStrum'..i..'X'] - 100 * math.cos((currentBeat + i*5) * math.pi), i)
		end
	end
	if swayingbiggest then
		for i=0,3 do
			setActorY(_G['defaultStrum'..i..'Y'] + 64 * math.cos((currentBeat + i*5) * math.pi),i)
		end
		for i=4,7 do
			setActorY(_G['defaultStrum'..i..'Y'] - 64 * math.cos((currentBeat + i*5) * math.pi),i)
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
	moveslow = true
	end
	if step == 640 then
	movearrow = true
	moveslow = false
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
	movearrow = false
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
	swayingbiggest = true
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