package;


import openfl.display.Sprite;
import starling.core.Starling;
import screens.InGame;


class Main extends Sprite {

	private var myStarling:Starling;
	
	
	public function new () {
		
		super ();

		myStarling = new Starling(InGame, stage);
		myStarling.antiAliasing = 1;
		myStarling.start();
	
	}
	
	
}