<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
include_once  $_SERVER['DOCUMENT_ROOT'].'/classes/users.php';

function update_user($gets,$db){
	$user = new user($db);
	$name = array_key_exists('name', $gets) ? $gets['name'] : "";
	$id = $gets['id'];
	$psw = array_key_exists('psw', $gets) ? $gets['psw'] : "";
	$email = array_key_exists('email', $gets) ? $gets['email'] : "";
        $IGN = array_key_exists('IGN', $gets) ? $gets['IGN'] : "";

	if( $name=="" && $psw=="" && $email=="" && $IGN=="" ){
		$res = "Error Nothing Given";
		return $res;}


	if(array_key_exists('name', $gets)){
		$query = "UPDATE users SET name='".$name."' WHERE id='".$id."'";
		$res = $user->updateq($query,$id);
	}
	if(array_key_exists('psw', $gets)){
		$query = "UPDATE users SET password='".md5($psw)."' WHERE id='".$id."'";
		$result = $user->updateq($query,$id);
		$res = ($res=="Failed") ? $res : $result;
	}
	if(array_key_exists('email', $gets)){
		$query = "UPDATE users SET email='".$email."' WHERE id='".$id."'";
		$result = $user->updateq($query,$id);
		$res = ($res=="Failed") ? $res : $result;
	}
        if(array_key_exists('IGN', $gets)){
		$query = "UPDATE users SET IGN='".$IGN."' WHERE id='".$id."'";
		$result = $user->updateq($query,$id);
		$res = ($res=="Failed") ? $res : $result;
	}
	return $res;
	}

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

if(isset($_GET['token']) && $_GET['token'] == "YOUR_PRIVATE_TOKEN" && isset($_GET['id'])){

		$gets = $_GET;
		$stmt = update_user($gets,$db);
                $respond = array(
				'state' => 'Success',
				'userInfo' => $stmt ,
			);
		http_response_code(200);
		echo json_encode($respond);

}else{
        http_response_code(200);
        echo json_encode(array('state' => 'Update Error'));
}

?>
