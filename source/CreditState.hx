package;
import flixel.*;
import flixel.addons.text.FlxTextField;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;
import flixel.util.FlxTimer;
import openfl.Assets;

class CreditState extends MusicBeatState
{
	
	

	public function new() 
	{
		super();
	}
	
	
	override function create() 
	{
		
		
		
		super.create();
		bgColor = 0xFF000000;
		var mural:FlxSprite = new FlxSprite();
		
		mural.loadGraphic(Paths.image("mural", "shared"));
		mural.antialiasing = true;
		add(mural);
		
		var cred:FlxText = new FlxText(0,720,640,"",16);
		cred.setFormat("DTM-Mono", 32, CENTER);
		cred.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xFF000000, 2);
		cred.alignment = "center";
		cred.scrollFactor.set(1,1.5);
		//cred.text = Assets.getText(Paths.txt("credits"));
		var daCreds:String = Assets.getText(Paths.txt("credits"));
		
		
		var title:FlxTextFormat = new FlxTextFormat(0xFFFF6699, true, false);
		
		
		var header:FlxTextFormat = new FlxTextFormat(0xFFFFDD00, true,false);
		
		var footnote:FlxTextFormat = new FlxTextFormat(0xFFFFCCDD, false,false,0);
		
		cred.applyMarkup(
			daCreds,
			[new FlxTextFormatMarkerPair(title, "@"),
			new FlxTextFormatMarkerPair(header, "^"),
			new FlxTextFormatMarkerPair(footnote, "#")
			
			
			
			]
		);
		cred.screenCenter(FlxAxes.X);
		add(cred);
		
		mural.scale.y = mural.scale.x = 1280 / mural.width;
		mural.updateHitbox();
		FlxG.sound.playMusic(Paths.music("dateWeekAnthem","shared"),1,false);
		FlxTween.tween(FlxG.camera.scroll, {y: (mural.height - 720)}, (FlxG.sound.music.length / 1000) - 9, {ease:FlxEase.linear,onComplete:GTFO});
	}
	
	override function update(elapsed:Float)
	{	
	if (controls.BACK)
		{
			new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				FlxG.switchState(new MainMenuState());
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
			});
			
		}
		super.update(elapsed);
	}		

	public function GTFO(e:FlxTween):Void{
			
		FlxG.switchState(new MainMenuState());
		
	};
	
}