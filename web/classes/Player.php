<?php

class Player{

    private $conn;
    private $table_name = "APEX_PLAYERS";

    public $Aid;
    public $Name;
    public $Platform;
    public $Kills;
    public $Level;

    public function __construct($db){
        $this->conn = $db;
    }

    function read(){
        $query = "SELECT * FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
   
   function readOne(){

    $query = "SELECT * FROM " . $this->table_name . " WHERE Name = ? AND Platform = ?";
    $stmt = $this->conn->prepare( $query );
    $stmt->bindParam(1, $this->Name);
    $stmt->bindParam(2, $this->Platform);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    $this->Name = $row['Name'];
    $this->Level = $row['Level'];
    $this->Platform = $row['Platform'];
    $this->Aid = $row['Aid'];
    $this->Kills = $row['Kills'];
    }
    
    
    function create(){
 
    $query = "INSERT INTO " . $this->table_name . " (Name,Platform,Kills,Level,Aid) VALUES (:name,:platform,:kills,:level,:aid)";
 
    $stmt = $this->conn->prepare($query);
 
    $this->name=htmlspecialchars(strip_tags($this->Name));
    $this->Platform=htmlspecialchars(strip_tags($this->Platform));
    $this->Kills=htmlspecialchars(strip_tags($this->Kills));
    $this->Levels=htmlspecialchars(strip_tags($this->Level));
    $this->Aid=htmlspecialchars(strip_tags($this->Aid));
 
    $stmt->bindParam(":name", $this->Name);
    $stmt->bindParam(":platform", $this->Platform);
    $stmt->bindParam(":level", $this->Level);
    $stmt->bindParam(":kills", $this->Kills);
    $stmt->bindParam(":aid", $this->Aid);
    
    if($stmt->execute()){
        return true;
    }else{
 
    return false;}
     
    }
    


}

?>
	