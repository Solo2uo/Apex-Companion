<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
include_once  $_SERVER['DOCUMENT_ROOT'].'/classes/Player.php';

$database = new Database();
$db = $database->getConnection();

$player = new Player($db);

$dataN = $_GET['Name'];
$dataP = $_GET['Platform'];
//$data = json_decode(file_get_contents("php://input"));

if(
    !empty($dataN) &&
    !empty($dataP)
){
    $json_string = "https://apextab.com/api/search.php?platform=".$dataP."&search=".urlencode($dataN);
    //$json_string = "https://reqres.in/api/users";
    $jsondata = file_get_contents($json_string);
    var_dump($jsondata);
    $obj = json_decode($jsondata,true);

    $player->Name = $obj["results"][0]["name"];
    $player->Platform = $obj["results"][0]["platform"];
    $player->Kills = $obj["results"][0]["kills"];
    $player->Level = $obj["results"][0]["level"];
    $player->Aid = $obj["results"][0]["aid"];

    if($player->create()){

        http_response_code(201);

        echo json_encode(array("SUCCESS" => "Player was created."));
    }

    else{

        http_response_code(503);

        echo json_encode(array("ERROR" => "Unable to create player."));
    }
}

else{

    http_response_code(400);

    echo json_encode(array("ERROR" => "Unable to create player. Data is incomplete."));
}
?>
