package;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var pixels:FlxTypedGroup<Pixel>;

	public var curPixel:Pixel;

	override public function create()
	{
		super.create();

		pixels = new FlxTypedGroup<Pixel>();
		add(pixels);

		curPixel = new Pixel(SAND);
		add(curPixel);

		FlxG.mouse.visible = false;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		for (pixel in pixels.members)
			performPixelAction(pixel);

		curPixel.setPosition(FlxG.mouse.x, FlxG.mouse.y);

		if (FlxG.keys.justReleased.ENTER)
		{
			var newPx:Pixel = new Pixel(curPixel.material, curPixel.x, curPixel.y);
			if (!getPixelOverlap(newPx))
				pixels.add(newPx);
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

		if (pixel.x < 0)
			pixel.x = 0;
		if (pixel.x > FlxG.width - pixel.width)
			pixel.x = FlxG.width - pixel.width;

		if (pixel.y < 0)
			pixel.y = 0;
		if (pixel.y > FlxG.width - pixel.width)
			pixel.y = FlxG.width - pixel.width;
	}
}
