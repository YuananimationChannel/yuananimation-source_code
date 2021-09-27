package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class MinnionBG extends FlxSprite
{
	public static var animationNotes:Array<Dynamic> = [];
	private var minionSpeed:Float;
	private var endingOffset:Float;
	private var goingRight:Bool;
	public var strumTime:Float;

	public function new(x:Float, y:Float, facingRight:Bool)
	{
		minionSpeed = 0.7;
		goingRight = false;
		strumTime = 0;
		goingRight = facingRight;
		super(x, y);

		frames = Paths.getSparrowAtlas('Red/minionRun', 'shared');
		animation.addByPrefix('run', 'Run', 24, true);
		animation.addByPrefix('shot', 'dead ' + FlxG.random.int(0, 2), 24, false);
		animation.play('run');
		animation.curAnim.curFrame = FlxG.random.int(0, animation.curAnim.frames.length - 1);
		antialiasing = true;

		updateHitbox();
		setGraphicSize(Std.int(0.8 * width));
		updateHitbox();
		trace("Please work ;(");
	}

	public function resetShit(x:Float, y:Float, goingRight:Bool):Void {
		this.x = x;
		this.y = y;
		this.goingRight = goingRight;
		endingOffset = FlxG.random.float(50, 200);
		minionSpeed = FlxG.random.float(0.6, 1);
		flipX = goingRight;
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if(this.x > -0.5 * FlxG.width && this.x < 1.2 * FlxG.width) {
			visible = true;
		} else {
			visible = false;
		}

		if(animation.curAnim.name == "run") {
			var speed:Float = (Conductor.songPosition - strumTime) * minionSpeed;
			if(goingRight) {
				this.x = (0.02 * FlxG.width - endingOffset) + speed;
			} else {
				this.x = (0.74 * FlxG.width + endingOffset) - speed;
			}
		} else if(animation.curAnim.name == 'shot' && animation.curAnim.curFrame >= animation.curAnim.frames.length - 1) {
			kill();
		}

		if(Conductor.songPosition > strumTime) {
			animation.play('shot');
			if(goingRight) {
				offset.x = 1805.9;
				offset.y = 439.25;
			}
		}
	}
}