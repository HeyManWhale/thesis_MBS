<?php
class DBMySQL{
	private static $conn = null;
	private function __construct(){}

	public static function connect(){
		//if singleton $conn has an instance already, returns instead to requestor
		if(!empty(self::$conn))
			return self::$conn;
		//else create new instance
		$server = "localhost";
		$user = "root";
		$password = "warez1896";
		$database = "maasin_bamboo_system";
		try{
			$conn = new mysqli($server, $user, $password, $database);
			//assign new instance to singleton $conn
			self::$conn = $conn;
			return $conn;
		}catch(Exception $e){
			die(print_r($e, true));
		}
	}
}
?>