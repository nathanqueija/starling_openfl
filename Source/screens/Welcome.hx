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


class Welcome extends Sprite {

    private var bg:Image;
    private var title:Image;
    private var hero:Image;

    private var playBtn:Button;
    private var aboutBtn:Button;
	
	public function new () {
		
		super ();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
	}

    private function onAddedToStage(event:Event):Void{
		trace("Welcome screen initialized");
        drawScreen();
	}

    private function drawScreen():Void{
       bg = new Image(Texture.fromBitmap( new Bitmap(Assets.getBitmapData ("assets/graphics/bgWelcome.jpg"))));
       this.addChild(bg);

       title = new Image(Texture.fromBitmap( new Bitmap(Assets.getBitmapData ("assets/graphics/welcome_title.png"))));
       title.x = 440;
       title.y = 20;
       this.addChild(title);

       hero = new Image(Texture.fromBitmap( new Bitmap(Assets.getBitmapData ("assets/graphics/welcome_hero.png"))));
       this.addChild(hero);

       playBtn = new Button(Texture.fromBitmap( new Bitmap(Assets.getBitmapData ("assets/graphics/welcome_playButton.png"))));
       playBtn.x = 500;
       playBtn.y = 260;
       this.addChild(playBtn);

       aboutBtn = new Button(Texture.fromBitmap( new Bitmap(Assets.getBitmapData ("assets/graphics/welcome_aboutButton.png"))));
        aboutBtn.x = 410;
       aboutBtn.y = 380;
       this.addChild(aboutBtn);
    }

    public function initialize():Void{
        this.visible = true;
        hero.x = -hero.width;
        hero.y = 100;

        Actuate.tween (hero, 2, { x: 80 } );

        this.addEventListener(Event.ENTER_FRAME, heroAnimation);
    }

    private function heroAnimation(event:Event):Void{
        var currentDate:Date = Date.now();
        hero.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
        playBtn.y = 260 + (Math.cos(currentDate.getTime() * 0.002) * 10);
        aboutBtn.y = 380 + (Math.cos(currentDate.getTime() * 0.002) * 10);
    }
	
	
}