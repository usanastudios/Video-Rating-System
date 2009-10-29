package com.GuN.UI.customUIComponent.textInput
{
	import com.GuN.UI.customUIComponent.textInput.sprites.SearchSprite;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	import mx.controls.List;
	import mx.controls.TextInput;

	public class MyCustomTextInput extends TextInput
	{
		
		[Embed(source='search.jpg')]
		public var Myimg:Class;
		
		var searchIcon:Bitmap;
		var isSearchDsp:Boolean = false;
		var isSpriteON:Boolean = false;
		var searchShape:Shape;
		var sprSearch:SearchSprite;
		var shadow:DropShadowFilter;
		var arrayValues:Array= ["Search by name","Search by address", "Search by popularity"];
		var listControl:List;
		var offset:Number= 3;
		
		public function MyCustomTextInput()
		{
			super();
			
			//remove the borders and make the background transparent
			setStyle("borderStyle", "none");
			setStyle("backgroundColor" , "transparent");
			setStyle("paddingLeft", "2");
			searchIcon = new Myimg();
			
			
			shadow = new DropShadowFilter();
				shadow.distance = 3;
				shadow.angle = 45;

			
			
			
			addEventListener(MouseEvent.CLICK, searchClicked);
			
		}
		
		private function searchClicked(e:MouseEvent){
			e.stopPropagation();
			
			if(e.localX < searchIcon.width){
				isSearchDsp = !isSearchDsp;
				this.invalidateDisplayList();
			}
			
			
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
           
           searchIcon.x = 3;
           
           	var paddingLeft:Number = getStyle("paddingLeft");
        	var paddingRight:Number = getStyle("paddingRight");
          	
           	
           	//place the textfield so it fit the container
           	textField.x = searchIcon.width+paddingLeft;
           	textField.width = Math.max(0, unscaledWidth-(searchIcon.width+paddingLeft));
        	textField.height = Math.max(0, 17);
        	
        	//draw the componenent UI
            this.graphics.beginFill(0xFFFFFF,1);
            this.graphics.drawRoundRect(0,0,unscaledWidth,17,10,10);
            
           	this.graphics.endFill();
           	
            addChild(searchIcon);
            
            if(isSearchDsp){
            	sprSearch = new SearchSprite(unscaledWidth,arrayValues);
            	sprSearch.filters = [shadow];
            	addChild(sprSearch);
            	
	            isSpriteON = true;
            }
            else{
            	if(isSpriteON){
            		removeChild(sprSearch);
            	}
            }
        }
        
		
	}
}