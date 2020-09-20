<?php
class user{
	private $conn;
	private $table = "users";

	private $id;
	private $username;
	private $password;
	private $IGN;
	private $email;

	public function __construct($db){
		$this->conn = $db;
	}
        function updateq($sql,$id){
                if ($this->conn->query($sql)) {
                $query = "SELECT * FROM users where id='".$id."'";
                $stmt = $this->conn->query($query);
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		if($row['id'] != null){
				$userInfo = array(
					'id' => $row['id'],
					'username' => $row['username'],
					'IGN' => $row['IGN'],
					'email' => $row['email'] 
				);
		}
		
		return $userInfo;
                } else {
                    return "Failed";
                }
                
        }
	function login($username,$psw){
		$query = "SELECT * FROM users where username='".$username."' AND password='".md5($psw)."'";
		
		$stmt = $this->conn->query($query);
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		if($row['id'] != null){
				$userInfo = array(
					'id' => $row['id'],
					'username' => $row['username'],
					'IGN' => $row['IGN'],
					'email' => $row['email'] 
				);
		}
		
		return $userInfo;
	}
		function getUsers(){
			$query = "SELECT * FROM users";
			$stmt = $this->conn->query($query);
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			return $row;
		}
		function register($username,$psw,$userId){
			$valQuery = "SELECT count(*) as resultCount from users where username='".$username."'";
			$stmt = $this->conn->query($valQuery);
			$row = $stmt->fetch(PDO::FETCH_ASSOC);
			if($row['resultCount'] == null || $row['resultCount'] != 0){
				return "Username Taken plese try an other one";
			}else{
				try{
					$insertQuery = "INSERT INTO users (username,password,name,IGN,avatar,email) VALUES ('".$username."','".md5($psw)."','".$userId."','null','null','null')";
				
				$this->conn->exec($insertQuery);
					return "Success";

				}catch(PDOException $e){
					return "Connexion Failure";
				}



			}

		}
	
}



?>