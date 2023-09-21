<?php
$alertOutput = "";
$tableOutput = "";
$formOutput = "";

if(isset($_POST['edit'])){

}
try{
	$conn = DBMySQL::connect();
	$query = $conn->query("SELECT l.lot_no, l.address FROM farm_ownership fo INNER JOIN lot l ON l.id = fo.lot_id INNER JOIN farmer f ON f.id = fo.farmer_id ORDER BY f.last_name, f.first_name, f.middle_name");
}
catch(Exception $e){
	$alertOutput .= print_r($e, true);
}
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../lib/custom.css">
	<title>Manager lot ownership</title>
</head>
<body>
	<?php echo $formOutput = "";?>
	<table>
		<thead>
			<tr>
				<th>Lot no.</th>
				<th>Address</th>
				<th>Barangay</th>
				<th>Current owner</th>
			</tr>
		</thead>
		<tbody>
			<?php echo $tableOutput;?>
		</tbody>
	</table>
</body>
</html>