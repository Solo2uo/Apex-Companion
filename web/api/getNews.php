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
include_once  $_SERVER['DOCUMENT_ROOT'].'/classes/News.php';

$database = new database();
$db = $database->getConnection();
if(isset($_GET['token']) && $_GET['token'] == "YOUR_PRIVATE_TOKEN"){
	$news = new News($db);
	$stmt = $news->getNews();
	echo json_encode($stmt);

}
?>