<?php
session_start();
require "../dbconfig/db_conn.php";
$alertOutput = "";
try{
	$conn = DBMySQL::connect();
	if(isset($_POST['submit']) && !empty($_POST['submit'])){
		$lotNumber = $_POST['lotNumber'];
		$address = $_POST['address'];
		$brgyID = $_POST['brgyID'];
		$arp = $_POST['arp'];
		$pin = $_POST['pin'];
		$points = json_decode($_POST['hdLatLng']);

		if(isset($points) && count($points) >= 3){
		//begin transaction: all or nothing
			try{
				$conn->begin_transaction();
				$query = $conn->prepare("INSERT INTO lot(lot_no, address, brgy_id, arp_no, pin) VALUES(?, ?, ?, ?, ?)");
				$query->bind_param("ssiss", $lotNumber, $address, $brgyID, $arp, $pin);
				$query->execute();
			//need to return generated ID
				$lotID = $conn->insert_id;

				$query = $conn->prepare("INSERT INTO lot_bounds(lot_id, latitude, longitude) VALUES(?, ?, ?)");
				foreach($points as $point){
					$query->bind_param("idd", $lotID, $point->lat, $point->lng);
					$query->execute();
				}
				$conn->commit();
				$alertOutput = "Successfully added lot";
			}
			catch(Exception $e){
			//if failed, eliminate all pending changes
				$alertOutput = print_r($e, true);
				$conn->rollback();
			}
		}
		else{
			$alertOutput = "Please plot at least 3 points";
		}
	}
	$query = $conn->query("SELECT id, name FROM barangay ORDER BY name");
	$ddBrgy = "";
	while($row = $query->fetch_assoc())
		$ddBrgy .= sprintf("<option value='%d'>%s</option>", $row['id'], $row['name']);
}
catch(Exception $e){
	$alertOutput = print_r($e, true);
}
finally{
	$conn->close();
}
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../lib/custom.css">
	<link rel="stylesheet" type="text/css" href="../lib/leaflet.css">

	<script type="text/javascript" src="../lib/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="../lib/leaflet.js"></script>
	<title>Add lot</title>
</head>
<body>
	<?php echo $alertOutput;?>
	<form method="POST" id="frForm">
		<label>Lot number</label>
		<input type="text" name="lotNumber" class="input-control mb" placeholder="Lot number" required>
		<label>Address</label>
		<input type="text" name="address" class="input-control mb" placeholder="Address" required>
		<label>Barangay</label>
		<select name="brgyID" class="input-control mb">
			<?php echo $ddBrgy; ?>
		</select>
		<label>ARP number</label>
		<input type="text" name="arp" class="input-control mb" placeholder="ARP number" required>
		<label>PIN</label>
		<input type="text" name="pin" class="input-control mb" placeholder="PIN" required>
		<input type="hidden" name="hdLatLng" id="hdLatLng">
		<input type="submit" name="submit" value="Save lot">
	</form>
	<hr>
	<button type="button" onclick="deleteLastPoint()">Delete last point</button>
	<div id="map" class="map"></div>
	<script type="text/javascript">
		var map = null;
		var tileLayer = null;
		var polygon = null;
		var points = [];
		var arrLatLng = [];
		$(document).ready(function(){
			loadMap();
		});

		function loadMap(){
			if(map == null){
				baseMap = L.map('map').setView([10.89096, 122.43372], 13);
				tileLayer = L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {maxZoom: 25, attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(baseMap);
				baseMap.on("click", function(event){
					drawLine(event.latlng);
				});
			}
		}

		function drawLine(latlng){
			if(polygon == null){
				points.push(latlng);
				arrLatLng.push({lat: latlng.lat, lng: latlng.lng});
				polygon = L.polygon(points, {color: "red"}).addTo(baseMap);
			}
			else{
				points.push(latlng);
				arrLatLng.push({lat: latlng.lat, lng: latlng.lng});
				polygon.setLatLngs(points);
			}
			updateHiddenValues();
		}

		function deleteLastPoint(){
			if(polygon != null){
				//remove last index
				points.pop();
				arrLatLng.pop();
				//if it was the last element on array, remove from map
				if(points.length == 0){
					baseMap.removeLayer(polygon);
					polygon = null;
				}
				else
					polygon.setLatLngs(points);
			}
			updateHiddenValues();
		}

		function updateHiddenValues(){
			$("#hdLatLng" ).val(JSON.stringify(arrLatLng));
		}
	</script>
</body>
</html>