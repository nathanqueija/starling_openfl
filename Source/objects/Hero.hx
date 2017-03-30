package objects;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import starling.display.Sprite;
import starling.events.Event;
import starling.display.Image;
import starling.textures.Texture;
import starling.display.Button;
import openfl.Assets;
import motion.Actuate;
import starling.display.MovieClip;
import starling.core.Starling;
import AssetsHelper;


class Hero extends Sprite {

    private var heroArt:MovieClip;
    
    public function new () {
		
		super ();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
	}

    private function onAddedToStage(event:Event):Void{
		this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
        createHeroArt();
	}

    private function createHeroArt():Void{
        trace(AssetsHelper.getAtlas().getTextures());
        heroArt = new MovieClip(AssetsHelper.getAtlas().getTextures("fly_"), 20);
        heroArt.x = Math.ceil(-heroArt.width/2);
        heroArt.y = Math.ceil(-heroArt.height/2);
        Starling.current.juggler.add(heroArt);
        this.addChild(heroArt);
    }
	
}