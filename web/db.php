<?php
$ROOT =  $_SERVER['DOCUMENT_ROOT'];

class Database{
 
    private $host = "YOUR_HOST";
    private $db_name = "YOUR_DB_NAME";
    private $username = "YOUR_USERNAME";
    private $password = "YOUR_PASSWORD";
    public $conn;
 
    public function getConnection(){
 
        $this->conn = null;
 
        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
 
        return $this->conn;
    }
}

?>
