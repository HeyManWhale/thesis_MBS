<?php
require "../dbconfig/db_conn.php";
$alertOutput = "";
try{
	$conn = DBMySQL::connect();
	if(isset($_POST['submit'])){
		$name = trim($_POST['name']);
		$username = trim($_POST['username']);
		$password = md5(trim($_POST['password']));
		$roleID = $_POST['role'];
		$query = $conn->prepare("INSERT INTO user(name, username, password, role_id) VALUES(?, ?, ?, ?)");
		//string, string, string, integer
		$query->bind_param("sssi", $name, $username, $password, $roleID);
		$query->execute();

		$alertOutput = "Successfully registered user, please wait for admin approval";
	}
	$query = $conn->query("SELECT id, name from role");
	$ddRole = "";
	while($row = $query->fetch_assoc())
		$ddRole .= sprintf("<option value='%d'>%s</option>", $row['id'], $row['name']);
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
	<title>Add user</title>
</head>
<body>
	<?php echo $alertOutput;?>
	<form method="POST">
		<label>Name</label>
		<input type="text" class="input-control mb" name="name" placeholder="Name" required>
		<label>Username</label>
		<input type="text" class="input-control mb" name="username" placeholder="Username" required>
		<label>Role</label>
		<select name="role" class="input-control mb">
			<?php echo $ddRole; ?>
		</select>
		<label>Password</label>
		<input type="password" class="input-control mb" name="password" placeholder="Password" required>
		<input type="submit" name="submit" value="Submit">
	</form>
</body>
</html>