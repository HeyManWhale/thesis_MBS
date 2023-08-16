<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../lib/custom.css">
	<link rel="stylesheet" type="text/css" href="../lib/leaflet.css">

	<script type="text/javascript" src="../lib/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="../lib/leaflet.js"></script>
	<title>Add lot reference</title>
</head>
<body>
	<label>Select image</label>
	<input type="file" accept="image/*" class="input-control mb" id="flSelectedImage">
	<label>Controls</label>
	<div>
		<input type="radio" id="idTopLeft" class="mb" name="anchor" onclick="changeAnchor(0)" checked>Top-left
		<input type="radio" id="idBottomRight" class="mb" name="anchor" onclick="changeAnchor(1)">Bottom-right
	</div>
	<div id="map" class="map"></div>
	<script type="text/javascript">
	//maintain aspect ratio
	var map = null;
	var tileLayer = null;
	$(document).ready(function(){
		loadMap();
		$("#flSelectedImage").change(function(event){
			var selectedFile = event.target.files[0];
			if(selectedFile){
				var image = new Image();
				image.src = URL.createObjectURL(selectedFile);

				image.onload = function(){
					var imageWidth = this.width;
					var imageHeight = this.height;

					var aspectRatio = imageWidth / imageHeight;

					var cappedDimension = 1500;

					var width, height;
					//If the image is in landscape orientation
					if(aspectRatio > 1){
						width = cappedDimension;
						height = cappedDimension / aspectRatio;
					}
					//if the image is in portrait orientation
					else{
						height = cappedDimension;
						width = cappedDimension * aspectRatio;
					}
				};
			}
		});
	});

	function loadMap(){
		if(map == null){
			baseMap = L.map('map').setView([10.89096, 122.43372], 13);
			tileLayer = L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {maxZoom: 25, attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(baseMap);
		}
	}

	function changeAnchor(mode){
		console.log(mode);
	}
</script>
</body>
</html>