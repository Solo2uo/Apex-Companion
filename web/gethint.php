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

$sql = "SELECT username FROM users";
$name = $db->query($sql);
$a = [];
foreach($name as $x)
$a[] = $x[0];
//echo "***";var_dump($a);echo "***";

// get the q parameter from URL
$q = $_REQUEST["q"];

$hint = "";

// lookup all hints from array if $q is different from "" 
if ($q !== "") {
    $q = strtolower($q);
    $len=strlen($q);
    foreach($a as $name) {
        if (stristr($q, substr($name, 0, $len))) {
            if ($hint === "") {
                $hint = $name;
            } else {
                $hint .= ", $name";
            }
        }
    }
}

// Output "no suggestion" if no hint was found or output correct values 
echo $hint === "" ? "no suggestion" : $hint;

?>