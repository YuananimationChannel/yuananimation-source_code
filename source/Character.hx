package;

import Song.SwagSong;
import Section.SwagSection;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-vibe':
				tex = Paths.getSparrowAtlas('characters/gf_vibe','shared');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);


				playAnim('danceRight');

			case 'gf-swapfell':
				tex = Paths.getSparrowAtlas('characters/GF_swapfell','shared');
				frames = tex;
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);


				playAnim('danceRight');

			case 'gf-final':
				tex = Paths.getSparrowAtlas('characters/GF_Final','shared');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);


				playAnim('danceRight');

			case 'gf-night':
				tex = Paths.getSparrowAtlas('characters/GF_Night','shared');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);
	
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
	
	
				playAnim('danceRight');

			case 'gf-red'://ok now get confused which file we use for gf-red :) - TaeYai 
				tex = Paths.getSparrowAtlas('characters/GF_Shoot','shared');
				frames = tex;
				animation.addByPrefix('shoot1', 'Pico shoot 1', 24, false); //Fuck why offset Auto Change
                animation.addByPrefix('shoot2', 'Pico shoot 2', 24, false);
				animation.addByPrefix('shoot3', 'Pico shoot 3', 24, false);
				animation.addByPrefix('shoot4', 'Pico shoot 4', 24, false);
                animation.addByIndices('idle1', 'idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
                animation.addByIndices('idle2', 'idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset("shoot1", 543, -5);
                addOffset("shoot2", 458, -5);
				addOffset('shoot3', 0, -5);
				addOffset('shoot4', 0, -5);
                addOffset('idle1');
                addOffset('idle2');

                loadMappedAnims();

                playAnim('idle1');

			case 'taeshoot':
				tex = Paths.getSparrowAtlas('characters/Tae_Shoot','shared');
				frames = tex;
				animation.addByPrefix('shoot1', 'Pico shoot 1', 24, false); //Fuck why offset Auto Change
                animation.addByPrefix('shoot2', 'Pico shoot 2', 24, false);
				animation.addByPrefix('shoot3', 'Pico shoot 3', 24, false);
				animation.addByPrefix('shoot4', 'Pico shoot 4', 24, false);

				addOffset("shoot1");
                addOffset("shoot2", 0, -127);
				addOffset('shoot3', 436, -20);
				addOffset('shoot4', 411, -67);

                loadAnims();

                playAnim('shoot1');

			case 'gf-wire':
				tex = Paths.getSparrowAtlas('characters/gfwire','shared');
				frames = tex;
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);


				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'taeworries':
				tex = Paths.getSparrowAtlas('characters/taeworries');
				frames = tex;
				animation.addByIndices('danceLeft', 'Tae idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'Tae idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	
				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');

			case 'bank':
				tex = Paths.getSparrowAtlas('characters/bank_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -16, 51);
				addOffset("singRIGHT", -43, 10);
				addOffset("singLEFT", 40, 27);
				addOffset("singDOWN", 37, -30);

				playAnim('idle');

			case 'boat':
				tex = Paths.getSparrowAtlas('characters/boat_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('Iwanttosing', 'Dad i wan to sing', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);
				addOffset('singDOWN-alt', -3, -3);

				playAnim('idle');

			case 'boat-playable':
				tex = Paths.getSparrowAtlas('characters/boat_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -16, 51);
				addOffset("singRIGHT", -43, 10);
				addOffset("singLEFT", 40, 27);
				addOffset("singDOWN", 37, -30);
				addOffset('Iwanttosing', -3, -3);

				playAnim('idle');

			case 'almondbon':
				var tex = Paths.getSparrowAtlas('characters/AlmondBonAsset','shared');
				frames = tex;
				animation.addByPrefix('idle', 'Almond Idle', 24);
				animation.addByPrefix('singUP', 'Almond Note Up', 24);
				animation.addByPrefix('singLEFT', 'Almond Note Right', 24);
				animation.addByPrefix('singDOWN', 'Almond Note Down', 24);
				animation.addByPrefix('singRIGHT', 'Almond Note Left', 24);

				addOffset('idle', 0,0 );
				addOffset("singUP", -44, 6);
				addOffset("singRIGHT", -40, -5);
				addOffset("singLEFT", -6, -23);
				addOffset("singDOWN", -59, -14);

				playAnim('idle');

				flipX = true;

			case 'tae':
				var tex = Paths.getSparrowAtlas('characters/MiniTae', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", 52, 31);
				addOffset("singRIGHT", -61, 12);
				addOffset("singLEFT", 80, -9);
				addOffset("singDOWN", -20, -70);
				addOffset("singUPmiss", 27, 72);
				addOffset("singRIGHTmiss", -38, 51);
				addOffset("singLEFTmiss", -60, 41);
				addOffset("singDOWNmiss", 98, -41);

				playAnim('idle');

				flipX = true;

			case 'conner':
				tex = Paths.getSparrowAtlas('characters/Conner_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Conner Idle', 24);
				animation.addByPrefix('singUP', 'Conner Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Conner Right Note', 24);
				animation.addByPrefix('singDOWN', 'Conner down note', 24);
				animation.addByPrefix('singLEFT', 'Conner Left Note', 24);

				addOffset('idle', 0,0 );
				addOffset("singUP", 36, 23);
				addOffset("singRIGHT", 16, 32);
				addOffset("singLEFT", 88, -1);
				addOffset("singDOWN", 32, -2);

				playAnim('idle');

			case 'boss':
				tex = Paths.getSparrowAtlas('characters/BOSS', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Boss idle dance', 24);
				animation.addByPrefix('singUP', 'Boss Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Boss Right Note', 24);
				animation.addByPrefix('singDOWN', 'Boss Down Note', 24);
				animation.addByPrefix('singLEFT', 'Boss Left Note', 24);

				addOffset('idle');
				addOffset("singUP", 14, 20);
				addOffset("singRIGHT", 130, -53);
				addOffset("singLEFT", -40, 0);
				addOffset("singDOWN", 0, -70);

				playAnim('idle');

			case 'boss-ultra':
				tex = Paths.getSparrowAtlas('characters/Boss_Ultra', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Boss idle', 24);
				animation.addByPrefix('singUP', 'Boss Note Up', 24);
				animation.addByPrefix('singRIGHT', 'Boss right note', 24);
				animation.addByPrefix('singDOWN', 'Boss Down Note', 24);
				animation.addByPrefix('singLEFT', 'Boss left note', 24);
				animation.addByPrefix('singRIGHT-alt', 'Boss laser', 24);
				animation.addByPrefix('singUP-alt', 'Boss Note Up', 24);
				animation.addByPrefix('singDOWN-alt', 'Boss Down Note', 24);
				animation.addByPrefix('singLEFT-alt', 'Boss left note', 24);

				addOffset('idle');
				addOffset("singUP", -118, 0);
				addOffset("singRIGHT", -170, 28);
				addOffset("singLEFT", -162, 60);
				addOffset("singDOWN", -47, -117);
				addOffset("singRIGHT-alt", 31, -112);
				addOffset("singUP-alt", -118, 0);
				addOffset("singLEFT-alt", -162, 60);
				addOffset("singDOWN-alt", -47, -117);

				playAnim('idle');

			case 'boss-wire':
				tex = Paths.getSparrowAtlas('characters/Bosswire', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Boss idle dance', 24);
				animation.addByPrefix('singUP', 'Boss Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Boss Right Note', 24);
				animation.addByPrefix('singDOWN', 'Boss Down Note', 24);
				animation.addByPrefix('singLEFT', 'Boss Left Note', 24);

				addOffset('idle');
				addOffset("singUP", 14, 20);
				addOffset("singRIGHT", 130, -53);
				addOffset("singLEFT", -40, 0);
				addOffset("singDOWN", 0, -70);

				playAnim('idle');
			case 'yuan-old':
				tex = Paths.getSparrowAtlas('characters/yuan_assets', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan idle dance', 24);
				animation.addByPrefix('singUP', 'Yuan Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Yuan Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Yuan Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", 0, 58);
				addOffset("singRIGHT", 0, 29);
				addOffset("singLEFT", 0, 9);
				addOffset("singDOWN", 0, -25);

				playAnim('idle');

			case 'yuan':
				tex = Paths.getSparrowAtlas('characters/yuananimation', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan Idle Dance', 24);
				animation.addByPrefix('singUP', 'Yuan Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Right Note', 24);
				animation.addByPrefix('singDOWN', 'Yuan Down Note', 24);
				animation.addByPrefix('singLEFT', 'Yuan Left Note', 24);

				addOffset('idle');
				addOffset("singUP", -6, 18);
				addOffset("singRIGHT", -8, 0);
				addOffset("singLEFT", 6, 2);
				addOffset("singDOWN", 22, -42);

				playAnim('idle');

			case 'yuan-bonus':
				tex = Paths.getSparrowAtlas('characters/Bonusyuan', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan Idle Dance', 24);
				animation.addByPrefix('singUP', 'Yuan Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Right Note', 24);
				animation.addByPrefix('singDOWN', 'Yuan Down Note', 24);
				animation.addByPrefix('singLEFT', 'Yuan Left Note', 24);

				addOffset('idle');
				addOffset("singUP", -6, 18);
				addOffset("singRIGHT", -8, 0);
				addOffset("singLEFT", 6, 2);
				addOffset("singDOWN", 22, -42);

				playAnim('idle');

			case 'yuan-vibe':
				tex = Paths.getSparrowAtlas('characters/Yuan_assetsEve', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan Idle Dance', 24);
				animation.addByPrefix('singUP', 'Yuan Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Right Note', 24);
				animation.addByPrefix('singDOWN', 'Yuan Down Note', 24);
				animation.addByPrefix('singLEFT', 'Yuan Left Note', 24);

				addOffset('idle');
				addOffset("singUP", -6, 18);
				addOffset("singRIGHT", -8, 0);
				addOffset("singLEFT", 6, 2);
				addOffset("singDOWN", 22, -42);

				playAnim('idle');

			case 'yuan-night':
				tex = Paths.getSparrowAtlas('characters/yuananimationnight', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan Idle Dance', 24);
				animation.addByPrefix('singUP', 'Yuan Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Right Note', 24);
				animation.addByPrefix('singDOWN', 'Yuan Down Note', 24);
				animation.addByPrefix('singLEFT', 'Yuan Left Note', 24);

				addOffset('idle');
				addOffset("singUP", -6, 18);
				addOffset("singRIGHT", -8, 0);
				addOffset("singLEFT", 6, 2);
				addOffset("singDOWN", 22, -42);

				playAnim('idle');

			case 'yuan-swapfell':
				tex = Paths.getSparrowAtlas('characters/yuanwapfell', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan Idle Dance', 24);
				animation.addByPrefix('singUP', 'Yuan Up Note', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Right Note', 24);
				animation.addByPrefix('singDOWN', 'Yuan Down Note', 24);
				animation.addByPrefix('singLEFT', 'Yuan Left Note', 24);

				addOffset('idle');
				addOffset("singUP", -6, 18);
				addOffset("singRIGHT", -8, 0);
				addOffset("singLEFT", 6, 2);
				addOffset("singDOWN", 22, -42);

				playAnim('idle');

			case 'yuan-vibe-old':
				tex = Paths.getSparrowAtlas('characters/yuan_vibe', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan idle dance', 24);
				animation.addByPrefix('singUP', 'Yuan Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Yuan Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Yuan Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", 0, 58);
				addOffset("singRIGHT", 0, 29);
				addOffset("singLEFT", 0, 9);
				addOffset("singDOWN", 0, -25);

				playAnim('idle');
			case 'yuan-night-old':
				tex = Paths.getSparrowAtlas('characters/Yuan_assetsNIGHT', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Yuan idle dance', 24);
				animation.addByPrefix('singUP', 'Yuan Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Yuan Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Yuan Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Yuan Sing Note LEFT', 24);
	
				addOffset('idle');
				addOffset("singUP", 0, 58);
				addOffset("singRIGHT", 0, 29);
				addOffset("singLEFT", 0, 9);
				addOffset("singDOWN", 0, -25);
	
				playAnim('idle');
			case 'pancake-evil':
				tex = Paths.getSparrowAtlas('characters/mini_pancake', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Pancake evil Idle', 24);
				animation.addByPrefix('singUP', 'Pancake evil note up', 24);
				animation.addByPrefix('singRIGHT', 'Pancake evil note right', 24);
				animation.addByPrefix('singDOWN', 'Pancake evil note down', 24);
				animation.addByPrefix('singLEFT', 'Pancake evil note left', 24);
		
				addOffset('idle');
				addOffset("singUP", 18, 4);
				addOffset("singRIGHT", -13, -10);
				addOffset("singLEFT", 14, -11);
				addOffset("singDOWN", -25, -8);
		
				playAnim('idle');

				flipX = true;

				setGraphicSize(Std.int(width * 1));
				updateHitbox();

			case 'pancake-sad':
				tex = Paths.getSparrowAtlas('characters/mini_pancake', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Pancake sad idle', 24);
				animation.addByPrefix('singUP', 'Pancake sad note up', 24);
				animation.addByPrefix('singRIGHT', 'Pancake sad note right', 24);
				animation.addByPrefix('singDOWN', 'Pancake sad note down', 24);
				animation.addByPrefix('singLEFT', 'Pancake sad note left', 24);
			
				addOffset('idle');
				addOffset("singUP", 18, 4);
				addOffset("singRIGHT", -13, -10);
				addOffset("singLEFT", 14, -11);
				addOffset("singDOWN", -25, -8);
		
				playAnim('idle');

				flipX = true;

				setGraphicSize(Std.int(width * 1));
				updateHitbox();
								
			case 'bf-vibe':
				var tex = Paths.getSparrowAtlas('characters/bf_vibe','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("hey", 7, 4);

				playAnim('idle');

				flipX = true;

			case 'bf-bonus':
				var tex = Paths.getSparrowAtlas('characters/BoyFriend_Bonus','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);

				playAnim('idle');

				flipX = true;				

			case 'bf-swapfell':
				var tex = Paths.getSparrowAtlas('characters/boyfriend_swapfell','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("hey", 7, 4);

				playAnim('idle');

				flipX = true;

			case 'jimmy':
				tex = Paths.getSparrowAtlas('characters/Jimmy_asset', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Jimmy Idle', 24);
				animation.addByPrefix('singUP', 'Jimmy Note Up', 24);
				animation.addByPrefix('singLEFT', 'Jimmy Note Left', 24);
				animation.addByPrefix('singRIGHT', 'Jimmy Note Right', 24);
				animation.addByPrefix('singDOWN', 'Jimmy Note Down', 24);
	
				addOffset('idle');
				addOffset("singUP", 0, 17);
				addOffset("singRIGHT", -13, -8);
				addOffset("singLEFT", 8, -4);
				addOffset("singDOWN", -5, -20);
	
				playAnim('idle');

			case 'bf-night':
				var tex = Paths.getSparrowAtlas('characters/BoyFriend_Night','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
	
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("hey", 7, 4);
	
				playAnim('idle');
	
				flipX = true;			

			case 'bf-red':
				var tex = Paths.getSparrowAtlas('characters/bf&yuan','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -42, 33);
				addOffset("singRIGHT", -47, -6);
				addOffset("singLEFT", 29, -5);
				addOffset("singDOWN", 14, -54);
				addOffset("singUPmiss", -45, 50);
				addOffset("singRIGHTmiss", -49, 44);
				addOffset("singLEFTmiss", 31, 37);
				addOffset("singDOWNmiss", 17, -3);

				playAnim('idle');

				flipX = true;

			case 'bf-final':
				var tex = Paths.getSparrowAtlas('characters/bf-yuan2','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('dodgeLEFT', 'BF NOTE LEFT DODGE', 24, false);
				animation.addByPrefix('dodgeRIGHT', 'BF NOTE RIGHT DODGE', 24, false);
				animation.addByPrefix('dodgeDOWN', 'BF NOTE DOWN DODGE', 24, false);
				animation.addByPrefix('dodgeUP', 'BF NOTEUP DODGE', 24, false);
				animation.addByPrefix('hit', 'BF hit yuan', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -42, 33);
				addOffset("singRIGHT", -47, -6);
				addOffset("singLEFT", 29, -5);
				addOffset("singDOWN", 14, -54);
				addOffset("singUPmiss", -45, 50);
				addOffset("singRIGHTmiss", -49, 44);
				addOffset("singLEFTmiss", 31, 37);
				addOffset("singDOWNmiss", 17, -3);
				addOffset("dodgeLEFT", -47, -12);
				addOffset("dodgeRIGHT", -47, -7);
				addOffset("dodgeDOWN", -22, -43);
				addOffset("dodgeUP", -4, 24);
				addOffset("hit", 55, 26);

				playAnim('idle');


				flipX = true;
			case 'bf-wire':
				var tex = Paths.getSparrowAtlas('characters/bf&yuanWIRE','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -42, 33);
				addOffset("singRIGHT", -47, -6);
				addOffset("singLEFT", 29, -5);
				addOffset("singDOWN", 14, -54);
				addOffset("singUPmiss", -45, 50);
				addOffset("singRIGHTmiss", -49, 44);
				addOffset("singLEFTmiss", 31, 37);
				addOffset("singDOWNmiss", 17, -3);

				playAnim('idle');

				flipX = true;
			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -20, 26);
				addOffset("singRIGHT", -130, -14);
				addOffset("singLEFT", 130, -10);
				addOffset("singDOWN", -50, -130);

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -30, -40);
				playAnim('idle');
			case 'monster-christmas':
				tex = Paths.getSparrowAtlas('characters/monsterChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -40, -94);
				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -68, -7);
				addOffset("singLEFT", 65, 9);
				addOffset("singDOWN", 200, -70);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;
	
				trace(tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
	
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	
				animation.addByPrefix('scared', 'BF idle shaking', 24);
	
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
	
				playAnim('idle');	

				flipX = true;

			case 'miniyuan':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND2', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'miniyuanmad':
				var tex = Paths.getSparrowAtlas('characters/miniyuanmad', 'shared');
				frames = tex;
	
				trace(tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('attack', 'BF hit', 24, false);
	
				addOffset('idle', -5);
				addOffset("singUP", -27, 23);
				addOffset("singRIGHT", -6, -3);
				addOffset("singLEFT", 1, 0);
				addOffset("singDOWN", -9, 27);
				addOffset("singUPmiss", -30, 25);
				addOffset("singRIGHTmiss", 1, 8);
				addOffset("singLEFTmiss", -5, 4);
				addOffset("singDOWNmiss", -1, 30);
				addOffset("attack", -16, 13);
	
				playAnim('idle');
	
				flipX = true;

			case 'miniyuansmile':
				var tex = Paths.getSparrowAtlas('characters/Mini yuan smile_assets', 'shared');
				frames = tex;
	
				trace(tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	
				addOffset('idle', -5);
				addOffset("singUP", -27, 23);
				addOffset("singRIGHT", -6, -3);
				addOffset("singLEFT", 1, 0);
				addOffset("singDOWN", -9, 27);
				addOffset("singUPmiss", -30, 25);
				addOffset("singRIGHTmiss", 1, 8);
				addOffset("singLEFTmiss", -5, 4);
				addOffset("singDOWNmiss", -1, 30);
	
				playAnim('idle');
	
				flipX = true;

			case 'bfyuan':
				var tex = Paths.getSparrowAtlas('characters/BFyuan2', 'shared');
				frames = tex;
	
				trace(tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				
				animation.addByPrefix('singUP-alt', 'BF NOTE UP ALT0', 24, false);
				animation.addByPrefix('singLEFT-alt', 'BF NOTE LEFT ALT0', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'BF NOTE RIGHT ALT0', 24, false);
				animation.addByPrefix('singDOWN-alt', 'BF NOTE DOWN ALT0', 24, false);
				animation.addByPrefix('singUPmiss-alt', 'BF NOTE UP ALT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss-alt', 'BF NOTE LEFT ALT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss-alt', 'BF NOTE RIGHT ALT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss-alt', 'BF NOTE DOWN ALT MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -2, 9);
				addOffset("singRIGHT", -24, 12);
				addOffset("singLEFT", -11, 3);
				addOffset("singDOWN", -26, 7);
				addOffset("singUPmiss", 5, 48);
				addOffset("singRIGHTmiss", -21, 30);
				addOffset("singLEFTmiss", -8, 37);
				addOffset("singDOWNmiss", -30, 58);

				addOffset("singUP-alt", -36, 21);
				addOffset("singRIGHT-alt", -46, 2);
				addOffset("singLEFT-alt", 4, -17);
				addOffset("singDOWN-alt", 46, 80);
				addOffset("singUPmiss-alt", -41, 51);
				addOffset("singRIGHTmiss-alt", -43, 60);
				addOffset("singLEFTmiss-alt", 7, 49);
				addOffset("singDOWNmiss-alt", 47, 82);

				playAnim('idle');

				flipX = true;

			case 'bfyuanboth':
				var tex = Paths.getSparrowAtlas('characters/BFYUANBoth', 'shared');
				frames = tex;
		
				trace(tex.frames.length);
		
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	
				addOffset('idle', -5);
				addOffset("singUP", -35, 25);
				addOffset("singRIGHT", -46, 3);
				addOffset("singLEFT", 5, -17);
				addOffset("singDOWN", 32, 84);
				addOffset("singUPmiss", -41, 53);
				addOffset("singRIGHTmiss", -46, 56);
				addOffset("singLEFTmiss", 6, 49);
				addOffset("singDOWNmiss", 28, 82);
	
				playAnim('idle');
	
				flipX = true;

			case 'bfyuan2':
				var tex = Paths.getSparrowAtlas('characters/BFYUAN3', 'shared');
				frames = tex;
		
				trace(tex.frames.length);
		        
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP ALT0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT ALT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT ALT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN ALT0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP ALT MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT ALT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT ALT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN ALT MISS', 24, false);
		
				addOffset('idle', -5);
				addOffset("singUP", -36, 21);
				addOffset("singRIGHT", -46, 2);
				addOffset("singLEFT", 4, -17);
				addOffset("singDOWN", 46, 80);
				addOffset("singUPmiss", -41, 51);
				addOffset("singRIGHTmiss", -43, 60);
				addOffset("singLEFTmiss", 7, 49);
				addOffset("singDOWNmiss", 47, 82);
		
				playAnim('idle');
	
				flipX = true;

			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/bfChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'bf-red-dead':
			    frames = Paths.getSparrowAtlas('characters/bfRedDEAD');
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);

				flipX = true;
			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('characters/mom_dad_christmas_assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -47, 24);
				addOffset("singRIGHT", -1, -23);
				addOffset("singLEFT", -30, 16);
				addOffset("singDOWN", -31, -29);
				addOffset("singUP-alt", -47, 24);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -30, 15);
				addOffset("singDOWN-alt", -30, -27);

				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
			case 'gf-red':
                if (animationNotes.length > 0 && Conductor.songPosition > animationNotes[0][0])
                {
                    var shootAnim = 1;
                    if (animationNotes[0][1] >= 2)
                        shootAnim = 3;

                    shootAnim += FlxG.random.int(0, 1);
                    playAnim("shoot" + shootAnim, true);
                    animationNotes.shift();
                }
                if (animation.curAnim != null && animation.curAnim.finished)
                {
                    playAnim(animation.curAnim.name, false, false, animation.curAnim.frames.length - 3);
					dance();
                }
			case 'taeshoot':
                if (animationNotes.length > 0 && Conductor.songPosition > animationNotes[0][0])
                {
                    var shootAnim = 1;
                    if (animationNotes[0][1] >= 2)
                        shootAnim = 3;

                    shootAnim += FlxG.random.int(0, 1);
                    playAnim("shoot" + shootAnim, true);
                    animationNotes.shift();
                }
                if (animation.curAnim != null && animation.curAnim.finished)
                {
                    playAnim(animation.curAnim.name, false, false, animation.curAnim.frames.length - 3);
					dance();
                }
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-vibe':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-swapfell':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					case 'gf-red':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('idle1');
						else
							playAnim('idle2');
					}
					case 'gf-wire':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					case 'gf-night':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
	
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					case 'gf-final':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
	
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					case 'taeworries':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
			
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				case 'gf-red':
					trace('SHOOT THEM ALL');
				case 'taeshoot':
					trace('SHOOT THEM ALL');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}
	public var animationNotes:Array<Dynamic> = [];

	public function loadMappedAnims():Void
		{
			var someShit:SwagSong = Song.loadFromJson("shootspeaker", "boss-fight-old");
			if (someShit.notes.length > 0)
			{
				animationNotes = [];
				MinnionBG.animationNotes = [];
				for (shitnote in someShit.notes)
				{
					for (somemoreshit in shitnote.sectionNotes)
					{
						animationNotes.push(somemoreshit);
					}
				}
				MinnionBG.animationNotes = animationNotes;
			}
		}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}

	public function loadAnims():Void
		{
			var someShit:SwagSong = Song.loadFromJson("taespeaker", "the-jimmy");
			if (someShit.notes.length > 0)
			{
				animationNotes = [];
				MinnionBG.animationNotes = [];
				for (shitnote in someShit.notes)
				{
					for (somemoreshit in shitnote.sectionNotes)
					{
						animationNotes.push(somemoreshit);
					}
				}
				MinnionBG.animationNotes = animationNotes;
			}
		}
}
