package com.GuN.UI.customUIComponent.textInput.sprites
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.controls.Alert;
	import mx.controls.List;

	public class SearchSprite extends Sprite
	{
		var _width:Number;
		var listControl:List;
		var offset:Number= 3;
		var _values:Array;
		
		
		public function SearchSprite(width:Number, values:Array)
		{
			super();
			this._values = values;
			this._width = width;
	
			drawShape();
		}
		
		private function mC(e:MouseEvent):void{
			var t:TextField = e.target as TextField;
			Alert.show(t.text);
		}
		
		private function mO(e:MouseEvent):void{
		
			var t:TextField = e.target as TextField;
			var tf:TextFormat = t.getTextFormat();
			tf.color = 0xFF00FF;
			t.defaultTextFormat = tf;
			//this.mouseChildren = false;
			this.useHandCursor = true;
			this.buttonMode = true;
			
		}
		
		private function drawShape(){
			this.graphics.beginFill(0xFFFFFF,.8);       	
			this.graphics.drawRoundRect(0,18,_width,(_values.length)*12+3 , 7, 7);
	        this.graphics.endFill();
	        
	        for(var i:uint=0; i<_values.length; i++){
	        	var lbl:TextField;
	        	lbl = new TextField();
	        	lbl.width = _width -6;
	        	lbl.addEventListener(MouseEvent.CLICK, mC);
	        	lbl.addEventListener(MouseEvent.MOUSE_OVER, mO);
	        	lbl.x = 3;
	        	lbl.y = (i*10)+20;
	        	lbl.background = false;
	            lbl.border = false;
	            
	
	            var format:TextFormat = new TextFormat();
	            format.font = "Verdana";
	            format.color = 0x000000;
	            format.size = 9;
	            format.underline = false;
	            
				lbl.text = _values[i];
	            lbl.defaultTextFormat = format;
	            addChild(lbl);
	        } 
	        
	        
		}
		
	}
}