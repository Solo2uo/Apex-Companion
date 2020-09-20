<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
include_once  $_SERVER['DOCUMENT_ROOT'].'/classes/Player.php';

$database = new Database();
$db = $database->getConnection();

$player = new Player($db);
$stmt = $player->read();
$num = $stmt->rowCount();
if($num>0){

    $players_arr=array();
    $players_arr["Success"]=array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        extract($row);

        $player_item=array(
            "Aid" => $Aid,
            "Name" => $Name,
            "Kills" => $Kills,
            "Level" => $Level,
            "Platform" => $Platform
        );

        array_push($players_arr["Success"], $player_item);
    }

    http_response_code(200);

    echo json_encode($players_arr);exit();

} else{
    http_response_code(404);
    echo json_encode(
        array("ERROR" => "No players found.")
    );
}
exit();
?>