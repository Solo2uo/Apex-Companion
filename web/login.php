<?php


/** read file*/
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
/** end read */

/**database file*/
include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
/** end dbfile */

/* usersClass*/
include_once  $_SERVER['DOCUMENT_ROOT'].'/classes/users.php';

/*Making a dbConnection to work on*/
$database = new database();
$db = $database->getConnection();

//@IP
if (!empty($_SERVER["HTTP_CLIENT_IP"])){
$ip = $_SERVER["HTTP_CLIENT_IP"];}
elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];}
else{
$ip = $_SERVER["REMOTE_ADDR"];}
$dateN = date('Y-m-d H:i:s');
$query = "INSERT INTO IPConn(Ips,DATEs) VALUES('".$ip."','".$dateN."')";
$db->query($query);

if(isset($_GET['token']) && $_GET['token'] == "YOUR_PRIVATE_TOKEN"){
	if(isset($_GET['username']) && isset($_GET['password'])){
		$username = $_GET['username'];
		$password = $_GET['password'];
		$user = new user($db);
		$stmt = $user->login($username,$password);
		if($stmt['id'] != null){
			$respond = array(
				'state' => 'Success',
				'userInfo' => $stmt ,
			);
			http_response_code(200);
			echo json_encode($respond);
		}else{
			echo json_encode(array('state' => 'loginError'));
			
		}
	}
}

?>