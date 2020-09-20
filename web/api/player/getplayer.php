<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');

include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
include_once  $_SERVER['DOCUMENT_ROOT'].'/classes/Player.php';

$database = new Database();
$db = $database->getConnection();

$player = new Player($db);

$player->Name = isset($_GET['Name']) ? $_GET['Name'] : die(json_encode(array("ERROR" => "Missing or Wrong Name parameter.")));
$player->Platform = isset($_GET['Platform']) ? $_GET['Platform'] : die(json_encode(array("ERROR" => "Missing or Wrong platform parameter.")));
urldecode($player->Platform);
urldecode($player->Name);
$player->readOne();

if(
($player->Name!=NULL) &&
($player->Platform!=NULL)
){

    $player_arr = array(
        "Aid" =>  $player->Aid,
        "Name" => $player->Name,
        "Platform" => $player->Platform,
        "Kills" => $player->Kills,
        "Level" => $player->Level
    );
    http_response_code(200);

    echo json_encode($player_arr);

}

else{
    http_response_code(404);

    echo json_encode(array("ERROR" => "Player does not exist."));
}
?>
