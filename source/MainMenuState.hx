package;

import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class MainMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	#if !switch
	var optionShit:Array<String> = ['story mode', 'freeplay', 'donate', 'options'];
	#else
	var optionShit:Array<String> = ['story mode', 'freeplay'];
	#end

	var newGaming:FlxText;
	var newGaming2:FlxText;
	public static var firstStart:Bool = true;

	public static var nightly:String = "";

	var checker:FlxBackdrop = new FlxBackdrop(Paths.image('Checker'), 0.2, 0.2, true, true);

	public static var kadeEngineVer:String = "1.5.4" + nightly;
	public static var gameVer:String = "0.2.7.1";

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	public static var finishedFunnyMove:Bool = false;
	public static var prevCharacter:Int = 99;
	var character:Character;
	var bg:FlxSprite;
	var targetY:Float;
	var targetX:Int;

	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		var line:FlxSprite = new FlxSprite().loadGraphic(Paths.image('blackline'));
		line.scrollFactor.set();
		line.updateHitbox();
		line.antialiasing = true;


		var random = FlxG.random.int(0,3);
		if (random == prevCharacter) {
			random++;
			if (random > 3) 
				random = 0;
		}

		switch (random) 
		{
			case 3:
				character = new Character(-2000, 400, 'bf-wire');
				bg = new FlxSprite(-89, -100).loadGraphic(Paths.image('WIREBG'));
				bg.scrollFactor.set();
				bg.updateHitbox();
				bg.antialiasing = true;		
				targetX = -40;
			case 2:
				character = new Character(-920, 180, 'yuan');
				bg  = new FlxSprite(-89, -100).loadGraphic(Paths.image('menuBG'));
				bg.scrollFactor.x = 0;
				bg.scrollFactor.y = 0.10;
				bg.setGraphicSize(Std.int(bg.width * 1.1));
				bg.updateHitbox();
				bg.screenCenter();
				bg.antialiasing = true;				
				targetX = 0;
			case 1:
				character = new Character(-2000, 150, 'boss');
				bg  = new FlxSprite(-89, -100).loadGraphic(Paths.image('redbg'));
				bg.scrollFactor.x = 0;
				bg.scrollFactor.y = 0.10;
				bg.setGraphicSize(Std.int(bg.width * 1.1));
				bg.updateHitbox();
				bg.screenCenter();
				bg.antialiasing = true;				
				targetX = -300;
			case 0:
				character = new Character(-2000, 300, 'bf');
				bg  = new FlxSprite(-89, -100).loadGraphic(Paths.image('menuBG'));
				bg.scrollFactor.x = 0;
				bg.scrollFactor.y = 0.10;
				bg.setGraphicSize(Std.int(bg.width * 1.1));
				bg.updateHitbox();
				bg.screenCenter();
				bg.antialiasing = true;				
				targetX = -40;
		}
		prevCharacter = random;
		character.debugMode = true;
		character.scale.set(0.8, 0.8);
		character.scrollFactor.set(0, 0);
		add(bg);
		add(checker);
		add(line);
		checker.scrollFactor.set(0, 0.07);
		add(character);

		camFollow = new FlxObject(0, 0, 1, 1);
		//add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		FlxTween.tween(character, {x: targetX}, 0.6, {
			ease: FlxEase.quadIn,
			startDelay:0.25,
			onComplete: function(twn:FlxTween) {
			}
		});

				var tex = Paths.getSparrowAtlas('Menu_Thai');
			
				var tex2 = Paths.getSparrowAtlas('FNF_main_menu_assets');
			
		

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(0, 60 + (i * 160));
			if(FlxG.save.data.eng)
				{
					menuItem.frames = tex2;
				}
			else if(!FlxG.save.data.eng)
				{
					menuItem.frames = tex;
					menuItem.scale.set(0.5, 0.5);
				}
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set(0, 0.15);
			menuItem.antialiasing = true;
			if (firstStart)
				FlxTween.tween(menuItem,{y: 60 + (i * 160)},1 + (i * 0.25) ,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{ 
						finishedFunnyMove = true; 
						changeItem();
					}});
			else
				menuItem.y = 60 + (i * 160);
		}

		firstStart = false;

		FlxG.camera.follow(camFollow, null, 0.60 * (60 / FlxG.save.data.fpsCap));

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, gameVer +  (Main.watermarks ? " FNF - " + kadeEngineVer + " Kade Engine" : ""), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();


		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function beatHit()
		{
			super.beatHit();
	
			character.playAnim('idle', true);
		}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		checker.x -= 0.45;
		checker.y -= 0.16;

		if (!selectedSomethin)
		{
			if (controls.UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				FlxG.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					FlxG.switchState(new CreditState());

					trace("CreditState Menu Selected");
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));
					

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 1.3, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
								new FlxTimer().start(1, function(tmr:FlxTimer)
								{
									goToState();
								});
							
						}
					});
				}
			}
		}



		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
			spr.x += 300;
		});
	}
	
	function goToState()
	{
		var daChoice:String = optionShit[curSelected];

		switch (daChoice)
		{
			case 'story mode':
				FlxG.switchState(new StoryMenuState());
				trace("Story Menu Selected");
			case 'freeplay':
				FlxG.switchState(new FreeplayState());

				trace("Freeplay Menu Selected");
			case 'donate':
				FlxG.switchState(new CreditState());
			case 'options':
				FlxG.switchState(new OptionsMenu());
		}
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;
		}
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
				//camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});
	}
}
