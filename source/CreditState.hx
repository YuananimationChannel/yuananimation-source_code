package;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;


#if windows
import Discord.DiscordClient;
#end

using StringTools;

class CreditState extends MusicBeatState
{
	var curSelected:Int = 0;
	var isinCat:Bool = false;
	var allTheStuff:Array<String> = [];
	var theStuffCat:Array<Int> = [];
	var theLinks:Array<String> = [];
	var catagories:Array<String> = [];
	var labels:Array<String> = [];
	var realLength:Int = 0;
	var curCatagory:Int = 0;
	var prevSelected:Int = 0;
	private var grpCatagories:FlxTypedGroup<Alphabet>;
	private var grpLabel:FlxTypedGroup<Alphabet>;

	private var iconArray:Array<HealthIcon> = [];

	override function create()
	{
		var isDebug:Bool = false;

		#if debug
		isDebug = true;
		#end

		catagories = [
			"All FNF Dev Team",
			"peetagorad",
			"TaeYai",
			"Yuan animation Channel",
			"Donate"

        ];
        var initStuff:Array<String> = [
            "0:ninjamuffin99://ninjamuffin99.newgrounds.com",
			"0:phantomarcade://phantomarcade.newgrounds.com",
			"0:kawaisprite://kawaisprite.newgrounds.com",
			"0:evilsk8r://evilsk8r.newgrounds.com",
			"1:youtube://youtube.com/channel/UCPjEXvh-57IBh-KVnzr1gMg",
            "2:youtube://youtube.com/channel/UC_OwYbXr0rkfLzkFl66GBTQ",
			"2:twitter://twitter.com/Taeyai_",
			"3:youtube://youtube.com/channel/UCtIH-QZgyOO7eMKtdO0Uk5A",
			"3:facebook://facebook.com/NgernYuAn",
			"3:twitter://twitter.com/AnimationYuan",
			"4:Kickstarter://kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game"
		];
        labels = [
			"Original Dev",
            "Music",
			"Coder Assistant",
			"Mod creator",
			"Original Game"
        ];
		
		
		for (i in 0...initStuff.length)
		{
			var data:Array<String> = initStuff[i].split(':');
			theStuffCat.push(Std.parseInt(data[0]));
			allTheStuff.push(data[1]);
			theLinks.push("https:" + data[2]);
		}
		// LOAD MUSIC

		// LOAD CHARACTERS

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		add(bg);

		grpCatagories = new FlxTypedGroup<Alphabet>();
		add(grpCatagories);
		grpLabel = new FlxTypedGroup<Alphabet>();
		add(grpLabel);

		for (i in 0...catagories.length)
		{
			var catagory:Alphabet = new Alphabet(0, (90 * i) + 30, catagories[i], true, false);
			var label:Alphabet = new Alphabet(0, (90 * i) + 30, labels[i], true, false);
			label.isLabel = true;
			label.move = false;
			label.tracker = catagory;
			label.alpha = 0.5;
			//catagory.move = false;
			catagory.isMenuItem = true;
			catagory.targetY = i;
			grpCatagories.add(catagory);
			realLength++;
			grpLabel.add(label);
		}
		changeSelection();

		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;
		if (!isinCat)
		{
			for (item in grpLabel) {
				item.setPosition(item.tracker.x, item.tracker.y - 70);
			}
		}
		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}
		if (controls.BACK)
		{
			if (!isinCat)
				FlxG.switchState(new MainMenuState());
			else
				leaveCatagory();
		}
		if (controls.ACCEPT)
		{
			if (!isinCat)
				enterCatagory();
			else {
				for (i in 0...theLinks.length) {
					if (theStuffCat[i] == curCatagory) {
						#if linux
						Sys.command('/usr/bin/xdg-open', [theLinks[curSelected + theStuffCat.indexOf(curCatagory)]], "&"]);
						#else
						FlxG.openURL(theLinks[curSelected + theStuffCat.indexOf(curCatagory)]);
						#end
					}
				}
			}
		}
	}
	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent('Fresh');
		#end
		trace(grpCatagories.length);
		// NGio.logEvent('Fresh');
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;
		
		if (curSelected < 0)
			curSelected = realLength - 1;
		if (curSelected >= realLength)
			curSelected = 0;


		var bullShit:Int = 0;
		for (i in 0...realLength)
		{
			grpCatagories.members[i].targetY = bullShit - curSelected;
			bullShit++;

			grpCatagories.members[i].alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (grpCatagories.members[i].targetY == 0)
			{
				grpCatagories.members[i].alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
			if (i == curSelected) {
				grpCatagories.members[i].alpha = 1;
			} else grpCatagories.members[i].alpha = 0.6;
		}
	}
	function enterCatagory()
	{
		realLength = 0;
		var order:Int = 1;
		isinCat = true;
		for (item in grpCatagories){
			grpCatagories.remove(item);
		}
		for (item in grpLabel) {
			grpLabel.remove(item);
		}
		prevSelected = curSelected;
		for (i in 0...allTheStuff.length) {
			if (theStuffCat[i] == curSelected) {
				var text:Alphabet = new Alphabet(0, (90 * order) + 30, allTheStuff[i], true, false);
				curCatagory = curSelected;
				//text.move = false;
				text.isMenuItem = true;
				text.targetY = order;
				order++;
				grpCatagories.add(text);
				realLength++;
			}
		}
		trace(grpCatagories.length);
		curSelected = 0;
		changeSelection();
	}
	function leaveCatagory()
	{
		realLength = 0;
		isinCat = false;
		for (item in grpCatagories){
			grpCatagories.remove(item);
		}
		for (item in grpLabel) {
			grpLabel.remove(item);
		}
		for (i in 0...catagories.length) {
			var catagory:Alphabet = new Alphabet(0, (90 * i) + 30, catagories[i], true, false);
			var label:Alphabet = new Alphabet(0, (90 * i) + 30, labels[i], true, false);
			label.isLabel = true;
			//label.move = false;
			label.tracker = catagory;
			label.alpha = 0.5;
			//catagory.move = false;
			catagory.isMenuItem = true;
			catagory.targetY = i;
			grpCatagories.add(catagory);
			grpLabel.add(label);
			realLength++;
		}
		curSelected = prevSelected;
		changeSelection();
	}
}
