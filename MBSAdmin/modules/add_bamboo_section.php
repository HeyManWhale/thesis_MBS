<?php 
require "../dbconfig/db_conn.php";
$alertOutput = "";
try{
	$conn = DBMySQL::connect();
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
		<select id="ddLot" name="lot">
			<?php echo $ddLot;?>
		</select>
		<button type="button" onclick="loadLotBounds()">Load lot</button>
	</form>
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
				baseMap = L.map('map').setView([10.89096, 122.43372], 13);
				tileLayer = L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {maxZoom: 25, attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(baseMap);
				baseMap.on("click", function(event){
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
						polygon = L.polygon(locations, {color: "red"}).addTo(map);
						//To be fixed
					});
				},
				error: function(jqHXR){
					console.log(jqHXR);
				}
			});
		}
	</script>
</body>
</html>