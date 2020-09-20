<?php
class News{
	private $conn;
	private $table = "news";

	private $id;
	private $title;
	private $details;
	private $date;
	private $writer;
	private $imageUrl;

	public function __construct($db){
			$this->conn = $db;
	}	

	public function getNews(){
		$query = "SELECT * FROM news ORDER BY date DESC";
		$stmt = $this->conn->prepare($query);
		$stmt->execute();
		$result = array();
		if($stmt->rowCount() > 0){
			$result['state'] = "Success";
			$result['resultSet'] = array();
			while($row = $stmt->fetch()){
				extract($row);
				$set = array(
					'id' => $row['id'],
					'title' => $row['title'],
					'details' => $row['details'],
					'date' => $row['date'],
					'writer' => $row['writer'],
					'img' => $row['imageUrl'],
                                        'url' => $row['url']
					);
				array_push($result['resultSet'], $set);
			}
		}else{
			$result = array('state' => 'error' );
		}
		return $result;
	}
}

?>