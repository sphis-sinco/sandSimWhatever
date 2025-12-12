package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var pixels:FlxTypedGroup<Pixel>;

	override public function create()
	{
		super.create();

		pixels = new FlxTypedGroup<Pixel>();
		add(pixels);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		for (pixel in pixels.members)
		{
			performPixelAction(pixel);
		}
	}

	public function getPixelOverlap(pixel:Pixel):Bool
	{
		for (px in pixels.members)
			if (px != pixel)
				return pixel.overlaps(px);

		return false;
	}

	public function performPixelAction(pixel:Pixel)
	{
		switch (pixel.material)
		{
			case SAND:
				if (!getPixelOverlap(pixel))
					pixel.y += pixel.height;

			default:
				// nothin
		}
	}
}
