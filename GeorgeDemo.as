package Classes {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.net.URLRequest; // help to get the files(can be online image in .png)
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.ui.Keyboard

	public class GeorgeDemo extends MovieClip {
		public var myLoader: Loader = new Loader();
		public var sourceBD: BitmapData = new BitmapData(48 * 16, 192, true); //"true" is declare transparent
		public var sourceBMP: Bitmap = new Bitmap(sourceBD);
		public var targetBD: BitmapData = new BitmapData(48, 192, true);
		public var targetBMP: Bitmap = new Bitmap(targetBD);
		public var frame: uint = 0;

		public function GeorgeDemo() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			myLoader.load(new URLRequest("george.png"));
			addChild(myLoader);
			myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded); //wait the image loading complete(asynchronous),then go to next section
			targetBMP.y = 200;
			addChild(targetBMP);
			myLoader.addEventListener(MouseEvent.CLICK, onClicked)
			//myLoader.addEventListener(KeyboardEvent.KEY_DOWN, onDown);//MouseEvent=>Event.ENTER_FRAME(sprite will keep move)
			//myLoader.addEventListener(KeyboardEvent.KEY_UP, onUp);

		}

		public function onKeyPressed(e: KeyboardEvent): void {

			if (e.keyCode == Keyboard.DOWN) {
				targetBD.copyPixels(sourceBD, new Rectangle(0, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
				frame++;
				if (frame == 4) {
					frame = 0;
				}
			} else if (e.keyCode == Keyboard.UP) {
				targetBD.copyPixels(sourceBD, new Rectangle(96, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
				frame++;
				if (frame == 4) {
					frame = 0;
				}
			} else if (e.keyCode == Keyboard.LEFT) {
				trace("This is left");
			} else if (e.keyCode == Keyboard.RIGHT) {
				trace("This is right");
			}
		}


		public function onLoaded(event: Event): void {
			sourceBD.draw(myLoader); //when sprite loaded, dreaw "myLoader"
		}

		public function onClicked(event: Event): void {
			targetBD.copyPixels(sourceBD, new Rectangle(0, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
			frame++;
			if (frame == 4) {
				frame = 0;
			}
		}

		//public function onDown(event:Event):void{
		//	targetBD.copyPixels(sourceBD, new Rectangle(0,frame*48,48,48), new Point(0,0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
		//	frame++;
		//	if (frame == 4){
		//		frame = 0;
		//	}
		//}	
		//public function onUp(event:Event):void{
		//	targetBD.copyPixels(sourceBD, new Rectangle(144,frame*48,48,48), new Point(0,0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
		//	frame++;
		//	if (frame == 4){
		//		frame = 0;
		//	}

	}

}