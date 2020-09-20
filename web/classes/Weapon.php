<?php

class Weapon{

    private $conn;
    private $table_name = "weapon";

    public $id;
    public $loaded;
    public $empty;
    public $dpsBody;
    public $dpsHead;
    public $body;
    public $head;
    public $multiplier;
    public $maxHeadshotRange;
    public $media;
    public $name;
    public $class;
    public $description;
    public $fireModes;
    public $ammo;
    public $magsize;
    public $rpm;
    public $recoil;
    public $attachments;

  public function __construct($db){
    $this->conn = $db;
  }

  function read(){
        $query = "select weapon.*, weapon_attachment.attachments_type, weapon_firemode.fire_modes_type, weapon_recoil.recoil_type ".
        "from weapon,weapon_attachment,weapon_firemode,weapon_recoil ".
        "where weapon.id=weapon_attachment.id and weapon_attachment.id=weapon_firemode.id and weapon_recoil.id=weapon_firemode.id order BY weapon.id";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

}
?>
