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
	if(isset($_GET['name']) && isset($_GET['password']) && isset($_GET['id'])){
		$username = $_GET['name'];
		$password = md5($_GET['password']);
		$userId = $_GET['id'];

		$user = new user($db);
		$stmt = $user->Register($username,$password,$userId);
		$respond  = array('state' => $stmt);http_response_code(200);
			echo json_encode($respond);
		
	}
}else{
        http_response_code(200);
        echo json_encode(array('state' => 'Getting Data Error'));
}

?>