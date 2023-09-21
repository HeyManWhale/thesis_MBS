<?php
require '../../dbconfig/db_conn.php';
$alertOutput = "";
$coordinates = array();
try{
	$conn = DBMySQL::connect();
	$lotID = $_POST['lotID'];
	$query = $conn->prepare("SELECT id, latitude, longitude FROM lot_bounds WHERE lot_id = ? ORDER BY id");
	$query->bind_param("i", $lotID);
	$query->execute();
	$rs = $query->get_result();
	while($row = $rs->fetch_assoc())
		array_push($coordinates, array("id"=>$row["id"], "lat"=>$row['latitude'], "lng"=>$row['longitude']));
}
catch(Exception $e){
	print_r($e);
}
echo json_encode(array("coordinates"=>$coordinates));
?>