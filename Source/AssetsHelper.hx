package;

import starling.textures.TextureAtlas;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import starling.textures.Texture;
import openfl.Assets;

class AssetsHelper{

    private static var gameTextureAtlas:TextureAtlas; 

    public static function getAtlas():TextureAtlas{
        if(gameTextureAtlas == null){
            var texture:Texture = Texture.fromBitmap( new Bitmap(Assets.getBitmapData ("assets/graphics/mySpritesheet.png")));
            var xml:Xml = Xml.parse(Assets.getText ("assets/graphics/mySpritesheet.xml"));
            
            gameTextureAtlas = new TextureAtlas(texture, xml);
            trace(gameTextureAtlas.getTextures("fly_"));
        }

        return gameTextureAtlas;
    }
}