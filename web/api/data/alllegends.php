<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/classes/Legend.php';
$database = new Database();
$db = $database->getConnection();

$legend = new Legend($db);
$stmt = $legend->read();
$num = $stmt->rowCount();
if($num>0){

  $legend_arr=array();
  $legend_arr["Success"]=array();
  $id_tst="";
  $abilities=array();
  $legend_item=array();
  $legends=array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
      extract($row);
      settype($lnumber , "integer");

      if ($id_tst != ""){
        if($id != $id_tst){
          $id_tst = $id;
          $legend_item["abilities"] = $abilities;
          array_push($legends,$legend_item);
          $legend_item = array();
          $abili = array();
          $abilities = array();
          $legend_item["id"] = $id;
          $legend_item["number"] = $lnumber;
          $legend_item["media"] = array(
              "movie" => $media_movie,
              "profile" => $media_profile,
              "wallpaper" => $media_wallpaper);
          $legend_item["name"] = $name;
          $legend_item["motto"] = $motto;
          $legend_item["type"] = $type;
          $legend_item["realName"] = $real_name;
          $legend_item["age"] = $age;
          $legend_item["tacticalAbility"] = $tactical_ability;
          $legend_item["passiveAbility"] = $passive_ability;
          $legend_item["ultimateAbility"] = $ultimate_ability;
          $legend_item["bio"] = $bio;

          $abili = array(
              "type" => $abilities_type,
              "name" => $abilities_name,
              "description" => $abilities_description,
              "media" => $abilities_media);
          array_push($abilities,$abili);
        } else {
          $abili = array(); //may be useless dunno
          $abili = array(
              "type" => $abilities_type,
              "name" => $abilities_name,
              "description" => $abilities_description,
              "media" => $abilities_media);
          array_push($abilities,$abili);
        }
      } else {
        $id_tst = $id;
        $legend_item["id"] = $id;
        $legend_item["number"] = $lnumber;
        $legend_item["media"] = array(
            "movie" => $media_movie,
            "profile" => $media_profile,
            "wallpaper" => $media_wallpaper);
        $legend_item["name"] = $name;
        $legend_item["motto"] = $motto;
        $legend_item["type"] = $type;
        $legend_item["realName"] = $real_name;
        $legend_item["age"] = $age;
        $legend_item["tacticalAbility"] = $tactical_ability;
        $legend_item["passiveAbility"] = $passive_ability;
        $legend_item["ultimateAbility"] = $ultimate_ability;
        $legend_item["bio"] = $bio;
        $abili = array(
            "type" => $abilities_type,
            "name" => $abilities_name,
            "description" => $abilities_description,
            "media" => $abilities_media);
        array_push($abilities,$abili);
      }

      array_push($legend_arr["Success"], $legend);
    }

    $legend_item["abilities"] = $abilities;
    array_push($legends,$legend_item);
    array_push($legend_arr["Success"], $legends);

    http_response_code(200);

    echo json_encode($legends);exit();

} else{
    http_response_code(404);
    echo json_encode(
        array("ERROR" => "No legends found.")
    );
}
exit();
?>
