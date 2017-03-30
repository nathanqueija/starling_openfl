package screens;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import starling.display.Sprite;
import starling.events.Event;
import starling.display.Image;
import starling.textures.Texture;
import starling.display.Button;
import openfl.Assets;
import motion.Actuate;
import objects.Hero;


class InGame extends Sprite {

  
	private var hero:Hero;
	public function new () {
		
		super ();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
	}

    private function onAddedToStage(event:Event):Void{
        this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		trace("InGame screen initialized");
        drawGame();
	}

    private function drawGame():Void{
        hero = new Hero();
        hero.x = stage.stageWidth/2;
        hero.y = stage.stageHeight/2;
        this.addChild(hero);

    }
	
}