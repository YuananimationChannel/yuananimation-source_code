package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('miniyuan', [38, 39], 0, false, isPlayer);
		animation.add('miniyuansmile', [38, 39], 0, false, isPlayer);
		animation.add('miniyuanmad', [36, 37], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('bf-vibe', [0, 1], 0, false, isPlayer);
		animation.add('bf-night', [0, 1], 0, false, isPlayer);
		animation.add('bf-swapfell', [0, 1], 0, false, isPlayer);
		animation.add('bf-bonus', [0, 1], 0, false, isPlayer);		
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('taeshoot', [4, 5], 0, false, isPlayer);
		animation.add('taeworries', [4, 5], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
		animation.add('pancake-evil', [32, 33], 0, false, isPlayer);
		animation.add('pancake-sad', [34, 35], 0, false, isPlayer);
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('boat', [40, 41], 0, false, isPlayer);
		animation.add('boat-playable', [40, 41], 0, false, isPlayer);
		animation.add('conner', [44, 45], 0, false, isPlayer);
		animation.add('bank', [46, 47], 0, false, isPlayer);
		animation.add('almondbon', [48, 49], 0, false, isPlayer);
		animation.add('yuan', [24, 25], 0, false, isPlayer);
		animation.add('yuan-swapfell', [24, 25], 0, false, isPlayer);
		animation.add('yuan-bonus', [24, 25], 0, false, isPlayer);
		animation.add('bf-red', [26, 27], 0, false, isPlayer);
		animation.add('bfyuan', [26, 27], 0, false, isPlayer);
		animation.add('bfyuan2', [26, 27], 0, false, isPlayer);
		animation.add('bfyuanboth', [26, 27], 0, false, isPlayer);
		animation.add('bf-final', [26, 27], 0, false, isPlayer);
		animation.add('boss', [28, 29], 0, false, isPlayer);
		animation.add('boss-ultra', [50, 51], 0, false, isPlayer);
		animation.add('yuan-vibe', [24, 25], 0, false, isPlayer);
		animation.add('yuan-night', [24, 25], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-vibe', [16], 0, false, isPlayer);
		animation.add('gf-night', [16], 0, false, isPlayer);
		animation.add('gf-final', [16], 0, false, isPlayer);
		animation.add('gf-red', [16], 0, false, isPlayer);
		animation.add('gf-wire', [16], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-swapfell', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		animation.add('jimmy', [30, 31], 0, false, isPlayer);
		animation.add('tae', [42, 43], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
