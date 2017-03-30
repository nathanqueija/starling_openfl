package;


import starling.display.Sprite;
import starling.core.Starling;
import starling.events.Event;
import screens.Welcome;


class Game extends Sprite {

	private var screenWelcome:Welcome;

	public function new () {
		super ();
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):Void{
		trace("starling framework initialized");
		screenWelcome = new Welcome();
		this.addChild(screenWelcome);
		screenWelcome.initialize();
	}
}