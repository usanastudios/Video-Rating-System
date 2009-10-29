package com.GuN.UI.customUIComponent.slider
{
	import com.GuN.UI.customUIComponent.slider.effect.FadeEffect;
	import com.GuN.UI.customUIComponent.slider.sprites.CSpSprite;
	import flash.geom.*
  import flash.display.*


	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	import mx.controls.sliderClasses.Slider;
	import mx.controls.sliderClasses.SliderThumb;

	public class CSpSliderThumb extends SliderThumb
	{
		private var isMoving:Boolean = false;
		private var spr:CSpSprite;
		private var gfxFade:FadeEffect;
		private var isDisplayed:Boolean = false;
		
			public function CSpSliderThumb()
			{
				super();
			initListeners();
			initSprite();
			var shadow:DropShadowFilter = new DropShadowFilter();
				shadow.distance = 3;
				shadow.angle = 45;
				spr.filters = [shadow];
			gfxFade = new FadeEffect(spr);
			spr.alpha = 0;	
			addChild(spr);
			useHandCursor = true;
			
			
			
		}
		
		private function initListeners():void{
			addEventListener(MouseEvent.MOUSE_MOVE, myMouseMoveHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		
		
		
		
		private function myMouseMoveHandler(event:MouseEvent):void
			{	
				if (isMoving)
				{
					spr.setValue(String(Slider(owner).values[Slider(owner).value]));
				}
			}
			
			
		private function mouseOver(evt:MouseEvent):void {
			/*if(!isDisplayed){
				    isDisplayed = true;
					gfxFade.show = true;
					spr.setValue(String(Slider(owner).values[Slider(owner).value]));
					gfxFade.play();
			}*/
				
		}
		
		private function mouseOut(evt:MouseEvent):void {
			/*if(isDisplayed && !isMoving){
				    isDisplayed = false;
					gfxFade.show = false;
					spr.setValue(String(Slider(owner).values[Slider(owner).value]));
					gfxFade.play();
			}*/
				
		}
		
		override protected function mouseDownHandler(event:MouseEvent):void
			{
				super.mouseDownHandler(event);
				isMoving = true;
				
				
				
			}
			
		override protected function mouseUpHandler(event:MouseEvent):void
			{
				super.mouseUpHandler(event);
				isMoving = false;
				
            
			}
			
		
		private function initSprite():void{
			spr = new CSpSprite();
			spr.x = -(spr.width/2)+4;
			spr.y = 9;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			
            super.updateDisplayList(unscaledWidth,unscaledHeight);
            
            
           this.graphics.beginFill(0xFFFFFF); 
           this.graphics.drawCircle(2,-13,10);
           this.graphics.moveTo(-15,0);
            //this.graphics.lineStyle(10,0x000000);
            //this.graphics.lineTo(10,0);
           	//this.graphics.endFill();
        }
       
        
        override protected function measure():void{
            super.measure();
            measuredWidth = 4;
            measuredHeight = 4;
            measuredMinHeight = 0;
            measuredMinWidth = 0;
        }
        
       
		
	}
}