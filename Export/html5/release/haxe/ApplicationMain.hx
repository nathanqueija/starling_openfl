package;


#if macro
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
#end

@:access(lime.app.Application)
@:access(lime.system.System)
@:access(openfl.display.Stage)


@:dox(hide) class ApplicationMain {
	
	
	#if !macro
	
	
	public static function main () {
		
		var projectName = "Hero";
		
		var config = {
			
			build: "58",
			company: "Company Name",
			file: "Hero",
			fps: 60,
			name: "Hero",
			orientation: "",
			packageName: "com.sample.hero",
			version: "1.0.0",
			windows: [
				
				{
					allowHighDPI: false,
					antialiasing: 0,
					background: 16777215,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 0,
					hidden: #if munit true #else null #end,
					maximized: null,
					minimized: null,
					parameters: {},
					resizable: true,
					stencilBuffer: true,
					title: "Hero",
					vsync: false,
					width: 0,
					x: null,
					y: null
				},
			]
			
		};
		
		lime.system.System.__registerEntryPoint (projectName, create, config);
		
		#if (hxtelemetry && !macro)
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		lime.system.System.embed (projectName, null, 0, 0, config);
		#end
		#else
		create (config);
		#end
		
	}
	
	
	public static function create (config:lime.app.Config):Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		ManifestResources.init (config);
		
		var preloader = getPreloader ();
		app.setPreloader (preloader);
		preloader.create (config);
		preloader.onComplete.add (start.bind (app.window.stage));
		
		for (library in ManifestResources.preloadLibraries) {
			
			preloader.addLibrary (library);
			
		}
		
		for (name in ManifestResources.preloadLibraryNames) {
			
			preloader.addLibraryName (name);
			
		}
		
		preloader.load ();
		
		var result = app.exec ();
		
		#if (sys && !ios && !nodejs && !emscripten)
		lime.system.System.exit (result);
		#end
		
	}
	
	
	#if (openfl < "5.0.0")
	#if (js && html5)
	@:keep @:expose("Hero.embed")
	public static function _embed (element:Dynamic, width:Null<Int> = null, height:Null<Int> = null, background:String = null, assetsPrefix:String = null) {
		
		lime.system.System.embed ("Hero", element, width, height, { background: background, assetsPrefix: assetsPrefix });
		
	}
	
	@:keep @:expose("openfl.embed")
	public static function _embed2 (element:Dynamic, width:Null<Int> = null, height:Null<Int> = null, background:String = null, assetsPrefix:String = null) {
		
		lime.system.System.embed ("Hero", element, width, height, { background: background, assetsPrefix: assetsPrefix });
		
	}
	#end
	#end
	
	
	public static function start (stage:openfl.display.Stage):Void {
		
		#if flash
		
		ApplicationMain.getEntryPoint ();
		
		#else
		
		try {
			
			ApplicationMain.getEntryPoint ();
			
		} catch (e:Dynamic) {
			
			stage.__handleError (e);
			
		}
		
		stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
		if (stage.window.fullscreen) {
			
			stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		#end
		
	}
	
	
	#end
	
	
	macro public static function getEntryPoint () {
		
		var hasMain = false;
		
		switch (Context.follow (Context.getType ("Main"))) {
			
			case TInst (t, params):
				
				var type = t.get ();
				
				for (method in type.statics.get ()) {
					
					if (method.name == "main") {
						
						hasMain = true;
						break;
						
					}
					
				}
				
				if (hasMain) {
					
					return Context.parse ("@:privateAccess Main.main ()", Context.currentPos ());
					
				} else if (type.constructor != null) {
					
					return macro {
						
						var current = stage.getChildAt (0);
						
						if (current == null || !Std.is (current, openfl.display.DisplayObjectContainer)) {
							
							current = new openfl.display.MovieClip ();
							stage.addChild (current);
							
						}
						
						new DocumentClass (cast current);
						
					};
					
				} else {
					
					Context.fatalError ("Main class \"Main\" has neither a static main nor a constructor.", Context.currentPos ());
					
				}
				
			default:
				
				Context.fatalError ("Main class \"Main\" isn't a class.", Context.currentPos ());
			
		}
		
		return null;
		
	}
	
	
	macro public static function getPreloader () {
		
		
		return macro { new openfl.display.Preloader (new openfl.display.Preloader.DefaultPreloader ()); };
		
		
	}
	
	
	#if (neko && !macro)
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		// Copy from https://github.com/HaxeFoundation/haxe/blob/development/std/neko/_std/Sys.hx#L164
		// since Sys.programPath () isn't available in __init__
		var sys_program_path = {
			var m = neko.vm.Module.local().name;
			try {
				sys.FileSystem.fullPath(m);
			} catch (e:Dynamic) {
				// maybe the neko module name was supplied without .n extension...
				if (!StringTools.endsWith(m, ".n")) {
					try {
						sys.FileSystem.fullPath(m + ".n");
					} catch (e:Dynamic) {
						m;
					}
				} else {
					m;
				}
			}
		};
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) sys_program_path #else Sys.executablePath () #end));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


#if !macro


@:build(DocumentClass.build())
@:keep @:dox(hide) class DocumentClass extends Main {}


#else


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes != null) {
			
			if (searchTypes.module == "openfl.display.DisplayObject" || searchTypes.module == "flash.display.DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [ { name: "current", opt: false, type: macro :openfl.display.DisplayObjectContainer, value: null } ], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			if (searchTypes.superClass != null) {
				
				searchTypes = searchTypes.superClass.t.get ();
				
			} else {
				
				searchTypes = null;
				
			}
			
		}
		
		return null;
		
	}
	
	
}


#end