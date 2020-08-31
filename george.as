package Classes {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.net.URLRequest; // help to get the files(can be online image in .png)
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.ui.Keyboard;


	public class george extends MovieClip {
		public var myLoader: Loader = new Loader();
		public var sourceBD: BitmapData = new BitmapData(48 * 16, 192, true); //"true" is declare transparent
		public var sourceBMP: Bitmap = new Bitmap(sourceBD);
		public var targetBD: BitmapData = new BitmapData(48, 48, true);
		public var targetBMP: Bitmap = new Bitmap(targetBD);
		public var frame: uint = 0;
		public var speed: Number = 5;
		public var count: Number =0;

		public function george() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			myLoader.load(new URLRequest("george.png"));
			//addChild(myLoader);
			myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded); //wait the image loading complete(asynchronous),then go to next section
			targetBMP.y = 150;
			targetBMP.x = 250;
			addChild(targetBMP);
			myLoader.addEventListener(MouseEvent.CLICK, onClicked);
			//myLoader.addEventListener(KeyboardEvent.KEY_DOWN, onDown);//MouseEvent=>Event.ENTER_FRAME(sprite will keep move)
			//myLoader.addEventListener(KeyboardEvent.KEY_UP, onUp);
			/*			stage.addEventListener(Event.ENTER_FRAME, updatePos);*/

		}

		public function onKeyPressed(e: KeyboardEvent): void {

			if (e.keyCode == Keyboard.DOWN) {
				targetBD.copyPixels(sourceBD, new Rectangle(0, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
				frame++;
				targetBMP.y = targetBMP.y + 5;
				if (frame == 4) {
					frame = 0;
				}
				if (maze.hitTestPoint(targetBMP.x, targetBMP.y + 48, true)) {
					targetBMP.y -= speed;
				}

			} else if (e.keyCode == Keyboard.UP) {
				targetBD.copyPixels(sourceBD, new Rectangle(96, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
				frame++;
				targetBMP.y = targetBMP.y - 5;
				if (frame == 4) {
					frame = 0;
				}
				if (maze.hitTestPoint(targetBMP.x, targetBMP.y, true)) {
					targetBMP.y += speed;
				}

			} else if (e.keyCode == Keyboard.LEFT) {
				targetBD.copyPixels(sourceBD, new Rectangle(48, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
				frame++;
				targetBMP.x = targetBMP.x - 5;
				if (frame == 4) {
					frame = 0;
				}
				if (maze.hitTestPoint(targetBMP.x, targetBMP.y, true)) {
					targetBMP.x += speed;
				}

			} else if (e.keyCode == Keyboard.RIGHT) {
				targetBD.copyPixels(sourceBD, new Rectangle(144, frame * 48, 48, 48), new Point(0, 0)); // "copyPixel" need 3 sources, new point can change to let the cartoon change place
				frame++;
				targetBMP.x = targetBMP.x + 5;
				if (frame == 4) {
					frame = 0;
				}
				if (maze.hitTestPoint(targetBMP.x + 48, targetBMP.y, true)) {
					targetBMP.x -= speed;

				}
				if (targetBMP.hitTestObject(c1)){
					c1.x = c1.y = -50;
					count++
				}
				if (targetBMP.hitTestObject(c2)){
					c2.x = c2.y = -50;
					count++
				}
				if (targetBMP.hitTestObject(c3)){
					c3.x = c3.y = -50;
					count++
				}
				if (targetBMP.hitTestObject(c4)){
					c4.x = c4.y = -50;
					count++
				}
				if (targetBMP.hitTestObject(c5)){
					c5.x = c5.y = -50;
					count++
				}
				
				if (count ==5){
					openMc.visible = false;
					openMc.x = -50;
					openMc.y = -50;
					
				}

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