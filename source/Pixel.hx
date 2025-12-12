import flixel.util.FlxColor;
import flixel.FlxSprite;

class Pixel extends FlxSprite
{
    public var material:Material = STONE;

	override public function new(material:Material = STONE, ?x:Float, ?y:Float)
	{
		super(x, y);

        this.material = material;
		makeGraphic(4, 4, 0xFFFFFF);
	}

    override function update(elapsed:Float) {
        super.update(elapsed);

        this.color = cast material;
    }
}

enum abstract Material(FlxColor) {
    var SAND = 0xE6E329;
    var STONE = 0x535353;
}