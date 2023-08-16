<?php
session_start();
require "../dbconfig/db_conn.php";
$alertOutput = "";
try{
	$username = trim($_POST['username']);
	$password = md5(trim($_POST['password']));
	$conn = DBMySQL::connect();
	$query = $conn->prepare("SELECT id, name, status FROM user WHERE username = ? AND password = ?");
	$query=>bind_param("ss", $username, $password);
	if($obj = $query->fetch_assoc()){
		if($obj['status'] <> 1)
			$alertOutput = "This user is not active";
		else{
			$_SESSION['id'] = $obj['id'];
			$_SESSION['name'] = $obj['name'];
			//launch homepage with different header
		}
	}
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
	<title>Login</title>
</head>
<body>
	<?php echo $alertOutput; ?>
	<form method="POST">
		<input type="text" name="username" class="input-control mb" placeholder="Username">
		<input type="password" name="password" class="input-control mb" placeholder="Password">
		<input type="submit" name="submit" value="Login">
	</form>
</body>
</html>