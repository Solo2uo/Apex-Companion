<?php
class Legend
{
  private $conn;
  private $table_name = "legend";

  public $movie;
  public $profile;
  public $wallpaper;
  public $id;
  public $number;
  public $name;
  public $motto;
  public $type;
  public $bio;
  public $realName;
  public $age;
  public $tacticalAbility;
  public $passiveAbility;
  public $ultimateAbility;
  public $abilities;

  public function __construct($db){
    $this->conn = $db;
  }

  function read(){
        $query = "select legend.*,abilities.abilities_type ,abilities.abilities_name ,abilities.abilities_media ,abilities.abilities_description ".
        "from legend,abilities where legend.id=abilities.lid";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }


}
?>
