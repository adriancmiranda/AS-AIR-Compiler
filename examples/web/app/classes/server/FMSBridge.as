package server {
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.events.Event;
	import flash.net.Responder;

	public final class FMSBridge extends EventDispatcher {
		public var connection:FMSConnection;
		public var client:FMSClient;

		public function FMSBridge(rtmpAddress:String = null, ...rest) {
			connection = new FMSConnection();
			connection.client = client = new FMSClient();
			rtmpAddress && connect.apply(this, [rtmpAddress].concat(rest));
		}

		public function connect(rtmpAddress:String, ...rest):void {
			connection.connect.apply(this, [rtmpAddress].concat(rest));
		}

		public function dispose():void {
			connection.dispose();
			client.dispose();
		}

		public function close():void {
			connection.close();
		}

		public function registerUser(token:String, email:String, player:uint):void {
			connection.call('registerUser', null, token, email, player);
		}

		public function signinUser(token:String):void {
			connection.call('signinUser', null, token);
		}

		public function changePlayer(player:uint):void {
			connection.call('changePlayer', null, player);
		}

		public function startGame():void {
			connection.call('startGame', null);
		}
		
		public function updateScore(score:uint):void {
			connection.call('updateScore', null, score);
		}
	}
}
