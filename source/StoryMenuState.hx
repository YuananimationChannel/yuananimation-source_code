package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;
import flixel.tweens.FlxEase;

import TitleState._yuansave;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class StoryMenuState extends MusicBeatState
{
	var scoreText:FlxText;

	var weekData:Array<Dynamic> = [
		['Tutorial'],
		['Yuan Time', 'Evening', 'Boss Fight'],
		['The Jimmy', 'Lost Control', 'Memorie']
	];
	var curDifficulty:Int = 2;

	public static var weekUnlocked:Array<Bool> = [true, true, true];

	var background:Array<String> = [
		'gfandbf',
		'yuan-chapter',
        'yuan-chapter2'
	];

	var weekNames:Array<String> = [
		"tutorial",
		"Chapter-1",
		"Chapter-2"
	];

	var weekColors:Array<String> = [
		"Brown",
		"Brown",
		"Brown"
	];

	var txtWeekTitle:FlxText;

	var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup<FlxSprite>;
	var grpbackground:FlxTypedGroup<MenuCharacter>;
	var grpWeekDifficulties:FlxTypedGroup<FlxSprite>;
	var grpWeekBackgrounds:FlxTypedGroup<FlxSprite>;
	var grpWeekSprites:FlxTypedGroup<FlxSprite>;

	var grpLocks:FlxTypedGroup<FlxSprite>;

	var difficultySelectors:FlxGroup;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
	var bg:FlxSprite;




	var storymodeLogo:FlxSprite;
	
	override function create()
	{
		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Story Mode Menu", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			if (!FlxG.sound.music.playing)
				FlxG.sound.playMusic(Paths.music('breakfast'));
		}
		FlxG.sound.playMusic(Paths.music('breakfast'));

		persistentUpdate = persistentDraw = true;

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		var yellowBG:FlxSprite = new FlxSprite(0, 56).makeGraphic(FlxG.width, 400, 0xFFF9CF51);

		
		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);


		grpbackground = new FlxTypedGroup<MenuCharacter>();

		grpLocks = new FlxTypedGroup<FlxSprite>();

		grpWeekBackgrounds = new FlxTypedGroup<FlxSprite>();
		add(grpWeekBackgrounds);
		
		grpWeekSprites = new FlxTypedGroup<FlxSprite>();
		add(grpWeekSprites);

		grpWeekText = new FlxTypedGroup<FlxSprite>();
		add(grpWeekText);


		
		grpWeekDifficulties = new FlxTypedGroup<FlxSprite>();
		add(grpWeekDifficulties);
		movedBack = true;
		for (i in 0...3) {
			var diffSprite:FlxSprite = new FlxSprite();
			switch (i) {
				case 0:
					diffSprite = new FlxSprite(0, FlxG.height).loadGraphic(Paths.image('storymenu/easy'));
				case 1:
					diffSprite = new FlxSprite(0, FlxG.height).loadGraphic(Paths.image('storymenu/normal'));
				case 2:
					diffSprite = new FlxSprite(0, FlxG.height).loadGraphic(Paths.image('storymenu/hard'));
			}
			grpWeekDifficulties.add(diffSprite);
		}

		
		for (i in weekColors) {
			bg = new FlxSprite(0, 0).loadGraphic(Paths.image("storymenu/" + i));
			grpWeekBackgrounds.add(bg);
			bg.visible = false;
			bg.alpha = 0;
		}
		grpWeekBackgrounds.members[0].visible = true;
		for (i in background) {
			var daSprite:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image("storymenu/" + i));
			daSprite.visible = false;
			grpWeekSprites.add(daSprite);
		}
		grpWeekSprites.members[0].visible = true;

		for (i in weekNames) {
			var weekThing:FlxSprite = new FlxSprite(0, -FlxG.height).loadGraphic(Paths.image('storymenu/' + i));
			weekThing.antialiasing = true;
			weekThing.visible = false;
			grpWeekText.add(weekThing);
		}
		grpWeekText.members[0].visible = true;
		for (i in grpWeekBackgrounds) {
			FlxTween.tween(i, {alpha: 1}, 0.6, {
				ease: FlxEase.quadOut,
			});
		}
		for (i in grpWeekText) {
			FlxTween.tween(i, {y: 0}, 2, {
				ease: FlxEase.quadOut,
				onComplete: function(twn:FlxTween) {
					movedBack = false;
				},
				startDelay: 0.3
			});
			
		}
		for (i in grpWeekDifficulties) {
			FlxTween.tween(i, {y: 0}, 1.5, {
				ease: FlxEase.quadOut,
				onComplete: function(twn:FlxTween) {
				},
				startDelay: 0.3
			});
		}



		trace("Line 70");

		
		
		leftArrow = new FlxSprite().loadGraphic(Paths.image("storymenu/LEFTARROW"));
		leftArrow.antialiasing = true;
		add(leftArrow);

		rightArrow = new FlxSprite().loadGraphic(Paths.image("storymenu/RIGHTARROW"));
		rightArrow.antialiasing = true;
		add(rightArrow);
		trace("Line 96");
		
		//add(difficultySelectors);

		trace("Line 124");

		trace("Line 150");


	

		trace("Line 165");

		super.create();
		changeDifficulty();
	}

	override function update(elapsed:Float)
	{
		// scoreText.setFormat('VCR OSD Mono', 32);
		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.5));

		// FlxG.watch.addQuick('font', scoreText.font);

		if (!movedBack)
		{
			if (!selectedWeek)
			{
				if (controls.LEFT_P)
				{
					changeWeek(-1);
				}

				if (controls.RIGHT_P)
				{
					changeWeek(1);
				}


				if (controls.UP_P)
					changeDifficulty(1);
				if (controls.DOWN_P)
					changeDifficulty(-1);
			}

			if (controls.ACCEPT)
			{
				selectWeek();
			}
		}

		if (controls.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			

			new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				FlxG.switchState(new MainMenuState());
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
			});
			
		}

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;
	function selectWeek()
	{
		if (weekUnlocked[curWeek])
		{
			trace(curWeek);
			if (stopspamming == false)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				stopspamming = true;
			}

			PlayState.storyPlaylist = weekData[curWeek];
			PlayState.isStoryMode = true;
			selectedWeek = true;

			var diffic = "";

			switch (curDifficulty)
			{
				case 0:
					diffic = '-easy';
				case 2:
					diffic = '-hard';
			}
			
			PlayState.storyDifficulty = curDifficulty;
			PlayState.SONG = Song.loadFromJson(StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase() + diffic, StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase());
			PlayState.storyWeek = curWeek;
			PlayState.campaignScore = 0;
			new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				if (curWeek == 1)
					{
						if (FlxG.save.data.dub)
							{
								var video:VideoHandlerMP4 = new VideoHandlerMP4();
								video.playMP4(Paths.video('yuantimeCutscene'), new PlayState(), false, false, false);
							}
						else if (!FlxG.save.data.dub)
							{
								var video:VideoHandlerMP4 = new VideoHandlerMP4();
								video.playMP4(Paths.video('yuantimeCutscene'), new PlayState(), false, false, false); //just change the name in ' '
							}
					}
					else
					{
						LoadingState.loadAndSwitchState(new PlayState(), true);
					}
				//LoadingState.loadAndSwitchState(new PlayState(), true);
			});
			
		}
	}

	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 2;
		if (curDifficulty > 2)
			curDifficulty = 0;
	
		for (i in grpWeekDifficulties) {
			i.alpha = 0;

			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
		grpWeekDifficulties.members[curDifficulty].alpha = 1;

		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);

		#if !switch
		intendedScore = Highscore.getWeekScore(curWeek, curDifficulty);
		#end
	}

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	function changeWeek(change:Int = 0):Void
	{
		var daBG = grpWeekBackgrounds.members[curWeek];
		var daSpr = grpWeekSprites.members[curWeek];
		var daTxt = grpWeekText.members[curWeek];
		//FlxTween.tween(daBG, {x: FlxG.width * change}, 0.6, {ease: FlxEase.quadOut});
		FlxTween.tween(daBG, {alpha: 0}, 0.6, {ease: FlxEase.quadOut});
		FlxTween.tween(daSpr, {x: FlxG.width * -change}, 0.6, {ease: FlxEase.quadOut});
		FlxTween.tween(daTxt, {x: FlxG.width * -change}, 0.6, {ease: FlxEase.quadOut, 
			onComplete: function(twn:FlxTween) {
				daBG.visible = false;
				daSpr.visible = false;
				daTxt.visible = false;
			},
		});
		curWeek += change;
		movedBack = true;
		
		if (curWeek >= weekData.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = weekData.length - 1;

		//grpWeekBackgrounds.members[curWeek].x = FlxG.width * -change;
		grpWeekBackgrounds.members[curWeek].visible = true;
		grpWeekBackgrounds.members[curWeek].alpha = 0;

		grpWeekSprites.members[curWeek].x = FlxG.width * change;
		grpWeekSprites.members[curWeek].visible = true;

		grpWeekText.members[curWeek].x = FlxG.width * change;
		grpWeekText.members[curWeek].visible = true;
		//FlxTween.tween(grpWeekBackgrounds.members[curWeek], {x: 0}, 0.6, {ease: FlxEase.quadOut});
		FlxTween.tween(grpWeekBackgrounds.members[curWeek], {alpha: 1}, 0.6, {ease: FlxEase.quadOut});
		FlxTween.tween(grpWeekSprites.members[curWeek], {x: 0}, 0.6, {ease: FlxEase.quadOut});
		FlxTween.tween(grpWeekText.members[curWeek], {x: 0}, 0.6, {ease: FlxEase.quadOut,
			onComplete: function(twn:FlxTween) {
				movedBack = false;
			},
		});
		var bullShit:Int = 0;
		
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}
