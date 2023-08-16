<?php
session_start();
require "../dbconfig/db_conn.php";
$alertOutput = "";

try{
	$conn = DBMySQL::connect();
	if(isset($_POST['submit'])){
		$lastName = $_POST['lastName'];
		$firstName = $_POST['firstName'];
		$middleName = $_POST['middleName'];
		$address = $_POST['address'];
		$brgyID = $_POST['brgyID'];
		$spouse = $_POST['spouse'];
		if(!isset($_SESSION['id'])){
			die("User is not logged in");
			//redirect to guest homepage
		}
		$userID = $_SESSION['id'];
		$query = $conn->prepare("INSERT INTO farmer(last_name, first_name, middle_name, address, brgy_id, spouse_first_name, user_id) VALUES(?, ?, ?, ?, ?, ?, ?)");
		$query->bind_param("ssssisi", $lastName, $firstName, $middleName, $address, $brgyID, $spouse);
		$query->execute();
		$alertOutput = "Successfully registered farmer, please wait for admin approval";
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
	<title>Add farmer</title>
</head>
<body>
	<?php echo $alertOutput;?>
	<form method="POST">
		<label>Last name</label>
		<input type="text" class="input-control mb" name="lastName" placeholder="Last name" required>
		<label>First name</label>
		<input type="text" class="input-control mb" name="firstName" placeholder="First name" required>
		<label>Middle name</label>
		<input type="text" class="input-control mb" name="middleName" placeholder="Middle name" required>
		<label>Address</label>
		<input type="text" class="input-control mb" name="address" placeholder="Address" required>
		<label>Barangay</label>
		<select name="brgyID" class="input-control mb">
			<?php echo $ddBrgy; ?>
		</select>
		<label>Spouse first name (optional)</label>
		<input type="text" class="input-control mb" name="spouse" placeholder="Spouse">
		<input type="submit" name="submit" value="Submit">
	</form>
</body>
</html>