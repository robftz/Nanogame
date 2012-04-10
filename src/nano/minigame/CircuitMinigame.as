package nano.minigame
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import nano.Assets;
	
	/**
	 * The circuit minigame! Place that mask! 
	 * @author devin
	 * 
	 */	
	
	public class CircuitMinigame extends Minigame
	{
		
		public static const CM_STATE_DRAG:String = "drag";
		
		private var background:Bitmap;
		private var theMask:Sprite;
		private var maskGuide:Sprite;
		private var electrodes:Sprite;
		private var foreground:Bitmap;
		
		public function CircuitMinigame()
		{
			super();
		}
		
		override protected function buildAssets():void {
			//this.electrodes = new Assets.instance.minigameCirCircuit();
			this.theMask = new Assets.instance.minigameCirMask()
			this.maskGuide = new Assets.instance.minigameCirGuide();
			this.foreground = new Assets.instance.minigameCirForground();
			
			//this.addChild(this.electrodes);
			this.addChild(this.theMask);
			this.addChild(this.maskGuide);
			this.addChild(this.foreground);
			
			// Initial Position
			this.theMask.y = 180;
			this.theMask.x = 300;
			
			this.maskGuide.y = 180;
			this.maskGuide.x = 380;
			
			// Interactive Events
			this.mouseEnabled = true;
			this.mouseChildren = false;
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, this.onMouseUp);
			
			//SUPERMAN
			super.buildAssets();
		}
		
		override public function set state(val:String):void {
			super.state = val;
		}
		
		override public function update(dt:Number):void {
			super.update(dt);
		}
		
		private function onMouseDown(event:MouseEvent):void {
			if(this.state == Minigame.STATE_PLAY) {
				this.state = CM_STATE_DRAG;
			}
		}
		
		private function onMouseUp(event:MouseEvent):void {
			if(this.state == CM_STATE_DRAG) {
				this.state = Minigame.STATE_PLAY;
			}
		}
	}
}