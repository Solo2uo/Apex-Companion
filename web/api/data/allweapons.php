<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once  $_SERVER['DOCUMENT_ROOT'].'/db.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/classes/Weapon.php';

$database = new Database();
$db = $database->getConnection();

$weapon = new Weapon($db);
$stmt = $weapon->read();
$num = $stmt->rowCount();
if($num>0){

    $weapons_arr=array();
    $weapons_arr["Success"]=array();
    $id_tst="";
    $weapon_item=array();
    $fireModes=array();
    $recoil=array();
    $attachments=array();
    $weapons=array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        extract($row);
        settype($rpm , "integer");
        settype($magsize, "integer");
        settype($damage_max_headshot_range, "integer");
        settype($damage_multiplier, "float");
        settype($damage_head, "integer");
        settype($damage_body, "integer");
        settype($damage_dps_head, "integer");
        settype($damage_dps_body, "integer");
           
        settype($reload_loaded, "float");
        settype($reload_empty, "float");

        if ($id_tst != ""){
          if($id != $id_tst){
            $id_tst = $id;
            $weapon_item["recoil"] = $recoil;

            $weapon_item["attachments"] = $attachments;
            $weapon_item["fireModes"] = $fireModes;
            /*$weapon_item["recoil"] = array(
                    "type" =>$recoil,
                    );*/
            array_push($weapons,$weapon_item);
            $weapon_item=array();
            $fireModes=array();
            $recoil=array();
            $attachments=array();
            $weapon_item["id"] = $id;
            $weapon_item["reload"] = array(
                "loaded" => $reload_loaded,
                "empty" => $reload_empty);
            $weapon_item["damage"] = array(
                "dps" => array(
                    "body" => $damage_dps_body,
                    "head" => $damage_dps_head),
                "body" => $damage_body,
                "head" => $damage_head,
                "multiplier" => $damage_multiplier,
                "maxHeadshotRange" => $damage_max_headshot_range);
            $weapon_item["media"] = $media;
            $weapon_item["name"] = $name;
            $weapon_item["class"] = $class;
            $weapon_item["description"] = $description;
            $weapon_item["ammo"] = $ammo;
            $weapon_item["magsize"] = $magsize;
            $weapon_item["rpm"] = $rpm;

            array_push($fireModes,$fire_modes_type);
            //$recoil_type = $recoil;
            array_push($recoil,$recoil_type);
            array_push($attachments,$attachments_type);

          } else{

            if (!in_array($fire_modes_type,$fireModes)){
            array_push($fireModes,$fire_modes_type);}
            if (!in_array($recoil_type,$recoil)){
            array_push($recoil,$recoil_type);}
            if (!in_array($attachments_type,$attachments)){
            array_push($attachments,$attachments_type);}

          }
        } else{

          $id_tst = $id;
          $weapon_item["id"] = $id;
          $weapon_item["reload"] = array(
              "loaded" => $reload_loaded,
              "empty" => $reload_empty);
          $weapon_item["damage"] = array(
              "dps" => array(
                  "body" => $damage_dps_body,
                  "head" => $damage_dps_head),
              "body" => $damage_body,
              "head" => $damage_head,
              "multiplier" => $damage_multiplier,
              "maxHeadshotRange" => $damage_max_headshot_range);
          $weapon_item["media"] = $media;
          $weapon_item["name"] = $name;
          $weapon_item["class"] = $class;
          $weapon_item["description"] = $description;
          $weapon_item["ammo"] = $ammo;
          $weapon_item["magsize"] = $magsize;
          $weapon_item["rpm"] = $rpm;

          array_push($fireModes,$fire_modes_type);
          array_push($recoil,$recoil_type);
          array_push($attachments,$attachments_type);

        }
    }

    $weapon_item["recoil"] = $recoil;
    $weapon_item["attachments"] = $attachments;
    $weapon_item["fireModes"] = $fireModes;
    array_push($weapons,$weapon_item);
    array_push($weapons_arr["Success"], $weapons);

    http_response_code(200);

    echo json_encode($weapons);exit();

} else{
    http_response_code(404);
    echo json_encode(
        array("ERROR" => "No weapons found.")
    );
}
exit();
?>
