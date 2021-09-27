package;

import Song.SwagSong;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

import TitleState._yuansave;

class Ending extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IT JUST A CAT";
	public static var currChanges:String = "meow";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();

		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"You beat the monster king"
			+ "\nYou have to find pancake"
			+ "\nAnd save the world"
			+ "\nBut there have bonus song in free Play"
			+ "\nIt will take you to another timeline"
			+ "\nWhere no monster kings have invaded the world."
			+ "\nYou can go and play it!",
			32);
		
		txt.setFormat("PanopticaPixel", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			trace("invited save");
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			_yuansave.data.leftState=true;
			_yuansave.flush();
			FlxG.switchState(new StoryMenuState());
		}
		super.update(elapsed);
	}
}
