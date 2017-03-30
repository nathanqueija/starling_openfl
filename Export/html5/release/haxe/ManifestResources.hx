package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "assetsPrefix")) {
			
			rootPath = Reflect.field (config, "assetsPrefix");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos)
			rootPath = "assets/";
			#elseif (windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash)
		
		#end
		
		var data, manifest, library;
		
		data = '{"name":null,"assets":"aoy4:pathy37:assets%2Ffonts%2Fembedded%2Ffonts.txty4:sizei302y4:typey4:TEXTy2:idR1y7:preloadtgoR0y32:assets%2Fgraphics%2FbgLayer1.jpgR2i215810R3y5:IMAGER5R7R6tgoR0y33:assets%2Fgraphics%2FbgWelcome.jpgR2i265502R3R8R5R9R6tgoR0y32:assets%2Fgraphics%2FmyGlyphs.fntR2i5289R3R4R5R10R6tgoR0y32:assets%2Fgraphics%2FmyGlyphs.pngR2i39325R3R8R5R11R6tgoR0y37:assets%2Fgraphics%2FmySpritesheet.pngR2i838021R3R8R5R12R6tgoR0y37:assets%2Fgraphics%2FmySpritesheet.xmlR2i6540R3R4R5R13R6tgoR0y43:assets%2Fgraphics%2Fwelcome_aboutButton.pngR2i8441R3R8R5R14R6tgoR0y36:assets%2Fgraphics%2Fwelcome_hero.pngR2i142972R3R8R5R15R6tgoR0y42:assets%2Fgraphics%2Fwelcome_playButton.pngR2i21639R3R8R5R16R6tgoR0y37:assets%2Fgraphics%2Fwelcome_title.pngR2i78548R3R8R5R17R6tgoR0y39:assets%2Fparticles%2FparticleCoffee.pexR2i1425R3R4R5R18R6tgoR0y41:assets%2Fparticles%2FparticleMushroom.pexR2i1390R3R4R5R19R6tgoR0y32:assets%2Fparticles%2Ftexture.pngR2i668R3R8R5R20R6tgoR2i280449R3y5:MUSICR5y28:assets%2Fsounds%2FbgGame.mp3y9:pathGroupaR22hR6tgoR2i280449R3R21R5y31:assets%2Fsounds%2FbgWelcome.mp3R23aR24hR6tgoR2i25076R3R21R5y28:assets%2Fsounds%2Fcoffee.mp3R23aR25hR6tgoR2i14627R3R21R5y25:assets%2Fsounds%2Feat.mp3R23aR26hR6tgoR2i10030R3R21R5y25:assets%2Fsounds%2Fhit.mp3R23aR27hR6tgoR2i10866R3R21R5y26:assets%2Fsounds%2Fhurt.mp3R23aR28hR6tgoR2i51408R3R21R5y26:assets%2Fsounds%2Flose.mp3R23aR29hR6tgoR2i25494R3R21R5y30:assets%2Fsounds%2Fmushroom.mp3R23aR30hR6tgh","version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_fonts_embedded_fonts_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_bglayer1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_bgwelcome_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_myglyphs_fnt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_myglyphs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_aboutbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_hero_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_playbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_particles_particlecoffee_pex extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_particlemushroom_pex extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_texture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_sounds_bggame_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bgwelcome_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_coffee_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_eat_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_lose_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mushroom_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:file("Assets/fonts/embedded/fonts.txt") #if display private #end class __ASSET__assets_fonts_embedded_fonts_txt extends haxe.io.Bytes {}
@:image("Assets/graphics/bgLayer1.jpg") #if display private #end class __ASSET__assets_graphics_bglayer1_jpg extends lime.graphics.Image {}
@:image("Assets/graphics/bgWelcome.jpg") #if display private #end class __ASSET__assets_graphics_bgwelcome_jpg extends lime.graphics.Image {}
@:file("Assets/graphics/myGlyphs.fnt") #if display private #end class __ASSET__assets_graphics_myglyphs_fnt extends haxe.io.Bytes {}
@:image("Assets/graphics/myGlyphs.png") #if display private #end class __ASSET__assets_graphics_myglyphs_png extends lime.graphics.Image {}
@:image("Assets/graphics/mySpritesheet.png") #if display private #end class __ASSET__assets_graphics_myspritesheet_png extends lime.graphics.Image {}
@:file("Assets/graphics/mySpritesheet.xml") #if display private #end class __ASSET__assets_graphics_myspritesheet_xml extends haxe.io.Bytes {}
@:image("Assets/graphics/welcome_aboutButton.png") #if display private #end class __ASSET__assets_graphics_welcome_aboutbutton_png extends lime.graphics.Image {}
@:image("Assets/graphics/welcome_hero.png") #if display private #end class __ASSET__assets_graphics_welcome_hero_png extends lime.graphics.Image {}
@:image("Assets/graphics/welcome_playButton.png") #if display private #end class __ASSET__assets_graphics_welcome_playbutton_png extends lime.graphics.Image {}
@:image("Assets/graphics/welcome_title.png") #if display private #end class __ASSET__assets_graphics_welcome_title_png extends lime.graphics.Image {}
@:file("Assets/particles/particleCoffee.pex") #if display private #end class __ASSET__assets_particles_particlecoffee_pex extends haxe.io.Bytes {}
@:file("Assets/particles/particleMushroom.pex") #if display private #end class __ASSET__assets_particles_particlemushroom_pex extends haxe.io.Bytes {}
@:image("Assets/particles/texture.png") #if display private #end class __ASSET__assets_particles_texture_png extends lime.graphics.Image {}
@:file("Assets/sounds/bgGame.mp3") #if display private #end class __ASSET__assets_sounds_bggame_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/bgWelcome.mp3") #if display private #end class __ASSET__assets_sounds_bgwelcome_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/coffee.mp3") #if display private #end class __ASSET__assets_sounds_coffee_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/eat.mp3") #if display private #end class __ASSET__assets_sounds_eat_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/hit.mp3") #if display private #end class __ASSET__assets_sounds_hit_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/hurt.mp3") #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/lose.mp3") #if display private #end class __ASSET__assets_sounds_lose_mp3 extends haxe.io.Bytes {}
@:file("Assets/sounds/mushroom.mp3") #if display private #end class __ASSET__assets_sounds_mushroom_mp3 extends haxe.io.Bytes {}
@:file("") #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)



#end
#end