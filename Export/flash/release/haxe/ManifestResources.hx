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
		
		data = '{"name":null,"assets":"aoy4:sizei302y4:typey4:TEXTy9:classNamey40:__ASSET__assets_fonts_embedded_fonts_txty2:idy37:assets%2Ffonts%2Fembedded%2Ffonts.txtgoR0i215810R1y5:IMAGER3y37:__ASSET__assets_graphics_bglayer1_jpgR5y32:assets%2Fgraphics%2FbgLayer1.jpggoR0i265502R1R7R3y38:__ASSET__assets_graphics_bgwelcome_jpgR5y33:assets%2Fgraphics%2FbgWelcome.jpggoR0i5289R1R2R3y37:__ASSET__assets_graphics_myglyphs_fntR5y32:assets%2Fgraphics%2FmyGlyphs.fntgoR0i39325R1R7R3y37:__ASSET__assets_graphics_myglyphs_pngR5y32:assets%2Fgraphics%2FmyGlyphs.pnggoR0i838021R1R7R3y42:__ASSET__assets_graphics_myspritesheet_pngR5y37:assets%2Fgraphics%2FmySpritesheet.pnggoR0i6540R1R2R3y42:__ASSET__assets_graphics_myspritesheet_xmlR5y37:assets%2Fgraphics%2FmySpritesheet.xmlgoR0i8441R1R7R3y48:__ASSET__assets_graphics_welcome_aboutbutton_pngR5y43:assets%2Fgraphics%2Fwelcome_aboutButton.pnggoR0i142972R1R7R3y41:__ASSET__assets_graphics_welcome_hero_pngR5y36:assets%2Fgraphics%2Fwelcome_hero.pnggoR0i21639R1R7R3y47:__ASSET__assets_graphics_welcome_playbutton_pngR5y42:assets%2Fgraphics%2Fwelcome_playButton.pnggoR0i78548R1R7R3y42:__ASSET__assets_graphics_welcome_title_pngR5y37:assets%2Fgraphics%2Fwelcome_title.pnggoR0i1425R1R2R3y44:__ASSET__assets_particles_particlecoffee_pexR5y39:assets%2Fparticles%2FparticleCoffee.pexgoR0i1390R1R2R3y46:__ASSET__assets_particles_particlemushroom_pexR5y41:assets%2Fparticles%2FparticleMushroom.pexgoR0i668R1R7R3y37:__ASSET__assets_particles_texture_pngR5y32:assets%2Fparticles%2Ftexture.pnggoR0i280449R1y5:MUSICR3y33:__ASSET__assets_sounds_bggame_mp3R5y28:assets%2Fsounds%2FbgGame.mp3goR0i280449R1R34R3y36:__ASSET__assets_sounds_bgwelcome_mp3R5y31:assets%2Fsounds%2FbgWelcome.mp3goR0i25076R1R34R3y33:__ASSET__assets_sounds_coffee_mp3R5y28:assets%2Fsounds%2Fcoffee.mp3goR0i14627R1R34R3y30:__ASSET__assets_sounds_eat_mp3R5y25:assets%2Fsounds%2Feat.mp3goR0i10030R1R34R3y30:__ASSET__assets_sounds_hit_mp3R5y25:assets%2Fsounds%2Fhit.mp3goR0i10866R1R34R3y31:__ASSET__assets_sounds_hurt_mp3R5y26:assets%2Fsounds%2Fhurt.mp3goR0i51408R1R34R3y31:__ASSET__assets_sounds_lose_mp3R5y26:assets%2Fsounds%2Flose.mp3goR0i25494R1R34R3y35:__ASSET__assets_sounds_mushroom_mp3R5y30:assets%2Fsounds%2Fmushroom.mp3gh","version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind #if display private #end class __ASSET__assets_fonts_embedded_fonts_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_bglayer1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_bgwelcome_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_myglyphs_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_myglyphs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_myspritesheet_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_aboutbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_hero_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_playbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_graphics_welcome_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_particles_particlecoffee_pex extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_particlemushroom_pex extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_particles_texture_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }@:keep @:bind #if display private #end class __ASSET__assets_sounds_bggame_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bgwelcome_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_coffee_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_eat_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_lose_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mushroom_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


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