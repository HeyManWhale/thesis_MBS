<?php
session_start();
require "../dbconfig/db_conn.php";
$alertOutput = "";
try{
	$conn = DBMySQL::connect();
	if(isset($_POST['submit'])){
		$lotID = $_POST['lot'];
		$matured = trim($_POST['matured']);
		$young = trim($_POST['young']);
		$destroyed = trim($_POST['destroyed']);
		$harvested = trim($_POST['harvested']);
		$exported = trim($_POST['exported']);
		$available = trim($_POST['available']);
		$remarks = trim($_POST['remarks']);

		if(!is_nan($matured) && !is_nan($young)){
			$validityCheck = true;
			if(!empty($destroyed) && is_nan($destroyed))
				$validityCheck = false;
			if(!empty($harvested) && is_nan($harvested))
				$validityCheck = false;
			if(!empty($exported) && is_nan($exported))
				$validityCheck = false;
			if(!empty($available) && is_nan($available))
				$validityCheck = false;

			if($validityCheck){
				//add mother record
				$query = $conn->prepare("INSERT INTO bamboo_section(lot_id, mature_count, young_count, destroyed_count, harvested_count, exported_count, available_count) VALUES(?, ?, ?, ?, ?, ?, ?)");
				$sectionID = $conn->insert_id;

				$query->bind_param("iiiiiii", $lotID, $matured, $young, $destroyed, $harvested, $exported, $available);
				$query->execute();

				//add log instance
				$query = $conn->prepare("INSERT INTO bamboo_inventory_logs(bamboo_section_id, initial_matured, initial_young, initial_destroyed, initial_harvested, initial_exported, remarks) VALUES(?, ?, ?, ?, ?, ?, ?)");
				$query->bind_param("iiiiiis", $sectionID, $matured, $young, $destroyed, $harvested, $exported, $remarks);
				$query->execute();
				
				$alertOutput = "Successfully added bamboo section";
			}
			else
				$alertOutput = "Values are invalid";
		}
		else
			$alertOutput = "Required values are invalid";
	}
	$query = $conn->query("SELECT id, lot_no FROM lot ORDER BY lot_no");
	$ddLot = "";
	while($row = $query->fetch_assoc())
		$ddLot .= sprintf("<option value='%d'>%s</option>", $row['id'], $row['lot_no']);
	
}catch(Exception $e){
	$alertOutput = print_r($e, true);
}
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../lib/custom.css">
	<link rel="stylesheet" type="text/css" href="../lib/leaflet.css">

	<script type="text/javascript" src="../lib/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="../lib/leaflet.js"></script>
	<title>Add bamboo section</title>
</head>
<body>
	<?php echo $alertOutput;?>
	<form method="POST" id="frForm">
		<label>Select lot</label>
		<div class="input-control mb">
			<select id="ddLot" name="lot">
				<?php echo $ddLot;?>
			</select>
			<button type="button" onclick="loadLotBounds()">Load lot</button>
		</div>
		<label>Enter initial values</label>
		<label>Number of matured bamboo</label>
		<input type="text" name="matured" class="input-control mb" placeholder="Matured count" required>
		<label>Number of young bamboo</label>
		<input type="text" name="young" class="input-control mb" placeholder="Young count" required>
		<label>Number of destroyed bamboo (optional)</label>
		<input type="text" name="destroyed" class="input-control mb" placeholder="Destroyed (optional)">
		<label>Number of harvested bamboo (optional)</label>
		<input type="text" name="harvested" class="input-control mb" placeholder="Harvested (optional)">
		<label>Number of exported bamboo (optional)</label>
		<input type="text" name="exported" class="input-control mb" placeholder="Exported (optional)">
		<label>Available to plant (optional)</label>
		<input type="text" name="available" class="input-control mb" placeholder="Available to plant (optional)">
		<label>Remarks</label>
		<input type="text" name="remarks" class="input-control mb" placeholder="Remarks">
		<input type="submit" name="submit" value="Submit">
	</form>
	<label>Plot bamboo section (optional)</label>
	<div id="map" class="map"></div>
	<script type="text/javascript">
		var map = null;
		var polygon = null;
		var locations = [];
		$(document).ready(function(){
			loadMap();
		});

		function loadMap(){
			if(map == null){
				map = L.map('map').setView([10.89096, 122.43372], 13);
				tileLayer = L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {maxZoom: 25, attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(map);
				map.on("click", function(event){
					drawLine(event.latlng);
				});
			}
		}

		function loadLotBounds(){
			var lotID = $("#ddLot").val();
			$.ajax({
				url: "ajax/getLotBoundary.php",
				method: "POST",
				dataType: "json",
				data: {lotID: lotID},
				success: function(data){
					locations = [];
					$.each(data.coordinates, function(idx, obj){
						locations.push([obj.lat, obj.lng]);
					});
					polygon = L.polygon(locations, {color: "red"}).addTo(map);
					map.setView(polygon.getCenter(), 15);
				},
				error: function(jqHXR){
					console.log(jqHXR);
				}
			});
		}
	</script>
</body>
</html>